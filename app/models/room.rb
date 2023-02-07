class Room < ApplicationRecord

    validates :title, presence: true
    validates :about, presence: true
    validates :price, presence: true
    validates :adress, presence: true

    has_many :reservations_path
    belongs_to :user, optional: true

    mount_uploader :img,ImgUploader
end
