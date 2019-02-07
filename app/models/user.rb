class User < ApplicationRecord
  has_secure_password
  belongs_to :city
  # has_many :gossips
  has_many :gossips
  #has_many :comments
  validates  :first_name, presence: true
  validates  :last_name,presence: true
  validates  :email, presence: true
  validates  :description, presence: true
  validates  :age, presence: true
  validates  :password, presence: true
end
