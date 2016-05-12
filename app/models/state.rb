class State < ActiveRecord::Base
  belongs_to :bug

  validates :device, presence: true
  validates :os, presence: true
  validates :memory, presence: true, numericality: { only_integer: true }
  validates :storage, presence: true, numericality: { only_integer: true }
end
