class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :user_groups
  has_many :user_groups
  accepts_nested_attributes_for :user_groups
  validates :name, presence: true, uniqueness: true
end
