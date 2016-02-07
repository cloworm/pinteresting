class Activity < ActiveRecord::Base

  self.inheritance_column = nil

  belongs_to :pin
  belongs_to :user

  validates :body, presence: true, if: :comment?

  def comment?
    type == "comment"
  end

  def like?
    type == "like"
  end

end
