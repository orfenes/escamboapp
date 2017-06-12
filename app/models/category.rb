class Category < ActiveRecord::Base

  # Gem Friendly Id
  include FriendlyId
  friendly_id :description, use: :slugged

  # associações
  has_many :ads

  # validations
  validates_presence_of :description

  scope :order_by_description, -> { order(:description) }
end
