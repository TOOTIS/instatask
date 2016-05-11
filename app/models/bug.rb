class Bug < ActiveRecord::Base
  has_one :state, dependent: :destroy
  accepts_nested_attributes_for :state

  class << self
  	def count(app_token)
  	  $redis.get "#{app_token}_bug_count"
  	end

  	def increment_number(app_token)
  	  $redis.incr "#{app_token}_bug_count"
  	end
  end
end
