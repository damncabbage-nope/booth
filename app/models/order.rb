class Order < ActiveRecord::Base
  ### Attributes ###
  attr_accessible :email

  ### Validations ###
  validates :email, :presence => true, :email => true
  validates :line_items, :length => {
    :minimum => 1,
    :message => "need at least one item in the order",
  }

  ### Associations ###
  has_many :line_items, :validate => true, :inverse_of => :order

  ### State Machine ###
  state_machine :status, :initial => :new do
    ACTIVE = [:resolved, :payment_pending, :refund_pending]

    state :new
    state :payment_pending
    state :refund_pending
    state :resolved
    state :cancelled

    # Events
    event :confirm do
      transition :new => :resolved, :if => :free?
      transition :new => :payment_pending, :if => :needs_payment?
    end

    event :resolve do
      transition ACTIVE => :payment_pending, :if => :needs_payment?
      transition ACTIVE => :refund_pending, :if => :needs_refund?
      transition ACTIVE => :resolved
    end

    # TODO: Hook that cancels attached line-items.
    #event :cancel do
    #  transition ACTIVE => :refund_pending, :if => :will_need_refund?
    #  transition ACTIVE => :cancelled
    #end

    # TODO: 'reopen' even not needed right now; add this plus after_save hooks on
    #       Ticket models to trigger reopening (if can_reopen?)
    #event :reopen do
    #  transition :cancelled => :payment_pending, :if => :needs_payment?
    #  transition :cancelled => :resolved, :if => :free?
    #end

    # TODO: Transition hooks; are these necessary for auditing?
    #after_transition any - :resolved => :resolved, :do => :update_resolved_at
    #after_transition :resolved => any - :resolved, :do => :update_resolved_at
  end


  ### Pricing ###

  def free?
    total_price == 0
  end

  def total_price
    line_items.map(&:amount).reduce(0, :+)
  end


  ### Balance/Transactions ###

  def balance
    0 # TODO: transactions.sum(:amount)
  end

  def settled_balance?
    !(needs_payment? && needs_refund?)
  end

  def needs_payment?
    balance < total_price
  end

  def needs_refund?
    total_price < balance
  end

  def will_need_refund?
    balance > 0
  end
end
