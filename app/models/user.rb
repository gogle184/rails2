class User < ApplicationRecord

  has_many :rooms
  has_many :reservations

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, on: :create,presence: true
  validates :profile, length:{maximum: 200}
end
