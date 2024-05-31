class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  before_create :generate_tracking_code

  has_many :visits

  private

  def generate_tracking_code
    self.tracking_code = SecureRandom.hex(10)
  end
end
