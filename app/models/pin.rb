class Pin < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image,
    styles: { medium: "300x300>", thumb: "100x100>" },
    :s3_protocol => Rails.env.production? ? :https : :http

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
