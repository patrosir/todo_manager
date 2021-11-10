class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true

  has_secure_password
  has_many :todos
end
