class Upload < ActiveRecord::Base

  belongs_to :pin
  belongs_to :user

  has_attached_file :attachment,
    styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" },
    :s3_protocol => Rails.env.production? ? :https : :http

  validates :attachment, attachment_presence: true

  # TODO: drill down on allowed content-types.
  validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  before_post_process :skip_unless_image

  def skip_unless_image
    # TODO: return fails unless it's an image, so we can skip the processing.
    true
  end
end
