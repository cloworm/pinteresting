class Upload < ActiveRecord::Base

  # TODO: drill down on allowed content-types.
  ALLOWED_CONTENT_TYPES = %w[
    image/jpg
    image/jpeg
    image/png
    image/gif
    application/x-zip-compressed
    application/zip
  ]

  belongs_to :pin
  belongs_to :user

  has_attached_file :attachment,
    styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>", thumbnail: "60x60#" },
    :s3_protocol => Rails.env.production? ? :https : :http

  validates :attachment, attachment_presence: true
  validates_with AttachmentSizeValidator, attributes: :attachment, less_than: 10.megabytes

  validates_attachment :attachment, content_type: { content_type: ALLOWED_CONTENT_TYPES }

  before_post_process :skip_unless_image

  # Return true if the attachment is an image.
  def image?
    @image ||= !!(attachment_content_type =~ /^image\/.+/)
  end

  private

  def skip_unless_image
    image?
  end

end
