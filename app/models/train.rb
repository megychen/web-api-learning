class Train < ApplicationRecord
  validates_presence_of :number
  has_many :reservations
  mount_uploader :train_logo, TrainLogoUploader
  # 产生位置从 1A~6C
  SEATS = begin
    (1..6).to_a.map do |series|
      ["A","B","C"].map do |letter|
        "#{series}#{letter}"
      end
    end
  end.flatten

  def available_seats
    # 所有SEATS 扣掉已经订位的资料
    return SEATS - self.reservations.pluck(:seat_number)
  end
end
