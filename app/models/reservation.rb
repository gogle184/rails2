class Reservation < ApplicationRecord
    belongs_to :room, optional: true
    belongs_to :user, optional: true

    

    validates :start_date,presence: true
    validates :end_date,on: :create,presence: true
    validate :start_end_check

    def start_end_check
        errors.add(:end_date,"は開始日より前の日付は登録できません")unless
        self.start_date < self.end_date
    end

    mount_uploader :img,ImgUploader
end
