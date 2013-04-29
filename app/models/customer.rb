class Customer < ActiveRecord::Base

  ### Attributes ###
  attr_accessible :email

  ### Validation ###
  validates :email, :email => { :allow_nil => true }

  # TODO: Consider guest/registered state switches, with email optional
  #       for the former and not the latter.

  ### Associations ###
  has_many :orders, :validate => true, :inverse_of => :customer

end
