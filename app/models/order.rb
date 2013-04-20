class Order < ActiveRecord::Base
  ### Attributes ###
  attr_accessible :email

  ### Validations ###
  validates :email, :presence => true, :email => true
  validates :line_items, :length => {:minimum => 1}

  ### Associations ###
  has_many :line_items, :validate => true
end
