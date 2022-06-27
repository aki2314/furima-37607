class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :firstname, presence: true
         validates :familyname, presence: true
         validates :firstname_two, presence: true
         validates :familyname_two, presence: true
         validates :birthday, presence: true











        end
