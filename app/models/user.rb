class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :meetings
    has_many :comments, dependent: :destroy

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX
    
    validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, massage: "名前を入れてください" }
    validates :team_name, presence: true
    validates :number, presence: true, format: { with: /\A[0-9]+\z/, massage: "背番号を入れてください" }
end
