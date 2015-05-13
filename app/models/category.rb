class Category < ActiveRecord::Base
  belongs_to :service
  has_many :tickets

  validates :name, presence: true

  scope :mains, -> { where(parent: nil) }
  scope :subs, -> { where.not(parent: nil) }
end
