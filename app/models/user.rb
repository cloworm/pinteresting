class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :pins
  has_many :activities
  has_many :acquired_likes, -> { where type: "like" }, through: :pins, source: :activities

  validates :name, presence: true

  def likes_pin? pin
    Activity.where(
      type: "like",
      user_id: self.id,
      pin_id: pin.id
    ).any?
  end
end
