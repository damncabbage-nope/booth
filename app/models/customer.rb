class Customer < ActiveRecord::Base

  ### Attributes ###
  attr_accessible :email

  ### Validation ###
  validates :token, :length => { :minimum => 80 }
  validates :email, :email => { :allow_nil => true }
  # TODO: Consider guest/registered state switches, with email optional
  #       for the former and not the latter.

  ### Associations ###
  has_many :orders, :validate => true, :inverse_of => :customer

  ### Hooks ###
  # Before Validation is an odd spot for this, but ensures we can use our own validation
  # rules to double-check we haven't screwed up the token generation.
  before_validation :generate_auth_token_if_needed, :on => :create

  protected

    ### Hooks ###
    # before_validation
    def generate_auth_token_if_needed
      self.token = Auth::Token.generate if self.token.blank?
      self.token.present?
    end
end
