class TicketDetails < ActiveRecord::Base
  self.table_name = :details

  ### Attributes ###
  attr_accessible :full_name

  ### Validations ###
  validates :full_name, :presence => true

  ### Associations ###
  has_one :line_item, :inverse_of => :details
end
