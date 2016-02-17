class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :pins
  has_many :activities
  has_many :acquired_likes, -> { where type: "like" }, through: :pins, source: :activities

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "110x110>", tiny: "40x40>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true

  PROFILE_FIELDS = %w[
    description
    title
    skill_2d
    skill_3d
  ]

  LAB_OPTIONS = {
    "bristol" => "Bristol, UK",
    "suwa" => "Suwa, Japan",
    "wayne" => "Wayne, NJ",
    "willich" => "Willich, Germany"
  }

  SKILL_LEVEL_OPTIONS = {
    "novice" => "Novice",
    "intermediate" => "Intermediate",
    "expert" => "Expert",
  }

  def self.lab_options
    LAB_OPTIONS.map do |short, pretty|
      [pretty, short]
    end
  end

  def self.skill_level_options
    SKILL_LEVEL_OPTIONS.map do |short, pretty|
      [pretty, short]
    end
  end

  def pretty_lab
    LAB_OPTIONS[lab]
  end

  def pretty_skill_2d
    SKILL_LEVEL_OPTIONS[skill_2d]
  end

  def pretty_skill_3d
    SKILL_LEVEL_OPTIONS[skill_3d]
  end

  def likes_pin? pin
    Activity.where(
      type: "like",
      user_id: self.id,
      pin_id: pin.id
    ).any?
  end

  def complete_profile?
    PROFILE_FIELDS.all? do |field|
      send(field).present?
    end
  end

end
