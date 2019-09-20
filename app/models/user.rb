class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_files , dependent: :destroy
  validates :name, presence: true, length: { maximum: 50, minimum: 6 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
