class GameWorld < ApplicationRecord
  belongs_to :user

  has_many :reservations, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?
end
