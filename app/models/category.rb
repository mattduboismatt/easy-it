class Category < ActiveRecord::Base
  belongs_to :service
  has_many :ticket_categories, dependent: :destroy
  has_many :tickets, through: :ticket_categories

  validates :name, presence: true
end
