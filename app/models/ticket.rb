class Ticket < ActiveRecord::Base
  belongs_to :user
  has_one :ticket_category, dependent: :destroy
  has_one :category, through: :ticket_category
  has_one :ticket_service, dependent: :destroy
  has_one :service, through: :ticket_service

  validates :title, :description, :category, :service, presence: true

  enum state: [:open, :pending, :active, :closed]

end
