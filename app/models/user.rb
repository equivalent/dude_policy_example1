class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :validatable # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable

  validates_presence_of :name
end
