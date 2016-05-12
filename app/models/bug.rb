class Bug < ActiveRecord::Base
  has_one :state, dependent: :destroy
  accepts_nested_attributes_for :state

  enum status: [:fresh, :in_progress, :closed]
  enum priority: [:minor, :major, :critical]

  validates :application_token, presence: true
  validates :priority, presence: true, inclusion: { in: priorities.keys }
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates_associated :state

  class << self
    def cached?(app_token)
      $redis.exists "#{app_token}_bug_count"
    end

    def count(app_token)
      $redis.get "#{app_token}_bug_count"
    end

    def increment_number(app_token)
      $redis.incr "#{app_token}_bug_count"
    end
  end
end
