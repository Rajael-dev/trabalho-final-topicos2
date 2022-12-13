class Region < ApplicationRecord

  validates :ddd, presence: true
  validates :name, presence: true

  belongs_to :user
  has_many :contacts
end
