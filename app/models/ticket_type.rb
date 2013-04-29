# NOTE: If we need to start selling not-ticket things, such as
#       cafe bookings or merchandise, consider creating a Product
#       class, have TicketType and friends extend from it, and
#       have LineItem switch between them with STI.

class TicketType < ActiveRecord::Base
  self.table_name = :products

  ### Attributes ###
  attr_accessible :name, :price

  ### Validations ###
  validates :price, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :name, :presence => true

  ### Associations ###
  belongs_to :event
  has_many :line_items, :inverse_of => :product
end
