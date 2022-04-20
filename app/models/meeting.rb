class Meeting < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :content, presence: true
  validates :attack,  presence: true
  validates :defence, presence: true
end
