class Category < ActiveRecord::Base

  # associações
  has_many :ads

  # validations
  validates_presence_of :description

  scope :order_by_description, -> { order(:description) }
end
