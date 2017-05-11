class Group < ApplicationRecord
  has_many :users, through: :user_groups
  has_many :user_groups
  has_many :messages
  validates :name, presence: true, uniqueness: true
  validates :user_groups, presence: true
end
