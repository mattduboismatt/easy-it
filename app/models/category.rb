class Category < ActiveRecord::Base
  belongs_to :service
  has_many :tickets

  validates :name, presence: true
end
