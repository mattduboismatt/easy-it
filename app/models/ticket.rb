class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, :description, presence: true

  enum state: [:open, :pending, :active, :closed]

  def service
    category.present? ? category.service : nil
  end
end
