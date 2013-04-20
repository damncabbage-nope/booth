class Order < ActiveRecord::Base
  ### Attributes ###
  attr_accessible :email

  ### Validations ###
  validates :email, :presence => true, :email => true
end
