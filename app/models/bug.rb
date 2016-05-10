class Bug < ActiveRecord::Base
  has_one :state, dependent: :destroy
end
