class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins
  has_many :activities

  validates :name, presence: true

  def likes_pin? pin
    Activity.where(
      type: "like",
      user_id: self.id,
      pin_id: pin.id
    ).any?
  end
end
