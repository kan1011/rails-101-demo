class Group < ApplicationRecord
  belongs_to :forum

  has_many :group_users, inverse_of: :group
  has_many :users, through: :group_users

  accepts_nested_attributes_for :group_users
end
