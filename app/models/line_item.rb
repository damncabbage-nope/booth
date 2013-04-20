class LineItem < ActiveRecord::Base
  ### Attributes ###
  # order_id, product_id, details_id, price

  ### Validations ###
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :order, :presence => true
  validates :product, :presence => true
  #validates :details, :presence => true

  ### Associations ###
  belongs_to :order, :inverse_of => :line_items

  # These are set up to be able to be switched to STI and Polymorphic
  # relations later, if/when we get things like merchandise as
  # separate types of product.
  belongs_to :product, :class_name => "TicketType", :validate => true
  #belongs_to :details, :class_name => "TicketDetails", :validate => true

  # Stubbed out for later use (if necessary).
  def quantity
    1
  end

  # Used by Order to calculate the total price.
  def amount
    price * quantity
  end
end
