class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable

  has_many :parcels

  def tracking_codes
    parcels.where.not(status: 'delivered').pluck(:tracking_code)
  end
end
