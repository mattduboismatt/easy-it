class Service < ActiveRecord::Base
  has_many :categories
  has_many :ticket_services, dependent: :destroy
  has_many :tickets, through: :ticket_services

  validates :name, presence: true, uniqueness: true
end
