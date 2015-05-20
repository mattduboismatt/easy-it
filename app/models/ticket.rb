class Ticket < ActiveRecord::Base
  belongs_to :user
  has_one :ticket_category, dependent: :destroy
  has_one :category, through: :ticket_category

  validates :title, :description, :category, presence: true

  enum state: [:open, :pending, :active, :closed]

  def service
    category.present? ? category.service : nil
  end
end
