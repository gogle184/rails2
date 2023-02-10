class Reservation < ApplicationRecord
    belongs_to :room, optional: true
    belongs_to :user, optional: true

    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :people, presence: true,numericality:{only_integer: true, greater_than_or_equal_to: 1}
    validate :start_end_check  

    def start_end_check
        if start_date.present? && end_date.present? && start_date>end_date 
            errors.add(:end_date,"はチェックインより前の日付は登録できません")
            #「=」が１つになってました。
        elsif start_date.present? && end_date.present? && start_date==end_date
            errors.add(:end_date,"をチェックインと同日にはできません※(日帰りは行っておりません)※")
        end
    end

    mount_uploader :img,ImgUploader
end