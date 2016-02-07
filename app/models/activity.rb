class Activity < ActiveRecord::Base

  self.inheritance_column = nil

  belongs_to :pin
  belongs_to :user

end
