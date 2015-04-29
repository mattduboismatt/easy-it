class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, :description, presence: true
end
