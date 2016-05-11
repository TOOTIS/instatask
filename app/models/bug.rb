class Bug < ActiveRecord::Base
  has_one :state, dependent: :destroy
  accepts_nested_attributes_for :state
end
