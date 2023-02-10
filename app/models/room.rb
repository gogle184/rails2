class Room < ApplicationRecord

    validates :title, presence: true
    validates :about, presence: true
    validates :price, presence: true,numericality:{only_integer: true, greater_than_or_equal_to: 1}
    validates :adress, presence: true
    
    has_many :reservations
    belongs_to :user, optional: true

    mount_uploader :img,ImgUploader
end
