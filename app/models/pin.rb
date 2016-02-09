class Pin < ActiveRecord::Base
  belongs_to :user
  has_many :activities

  has_attached_file :image,
    styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" },
    :s3_protocol => Rails.env.production? ? :https : :http

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :image, presence: true
  validates :description, presence: true

  def likes_count
    @likes_count ||= activities.select { |a| a.like? }.count
  end

end
