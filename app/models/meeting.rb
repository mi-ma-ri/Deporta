class Meeting < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :attack,  presence: true
  validates :defence, presence: true
  validates :attack_url, presence: true
  validates :defence_url, presence: true
end
