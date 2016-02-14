class Tag < ActiveRecord::Base
  scope :machine, -> { where(category: "machine") }
  scope :place, -> { where(category: "place") }
end
