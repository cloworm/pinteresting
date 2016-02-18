class Upload < ActiveRecord::Base

  belongs_to :pin
  belongs_to :user

  has_attached_file :attachment,
    styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>", thumbnail: "60x60#" },
    :s3_protocol => Rails.env.production? ? :https : :http

  validates :attachment, attachment_presence: true
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 10.megabytes

  # TODO: drill down on allowed content-types.
  validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/x-zip-compressed"] }

  before_post_process :skip_unless_image

  def skip_unless_image
    !(data_content_type =~ /^image.*/).nil?
  end
end
