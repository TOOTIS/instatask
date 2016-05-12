class BugsWorker
  include Sidekiq::Worker

  def perform(*args)
    attrs_hash = HashWithIndifferentAccess.new(args[0])
    bug = Bug.new(attrs_hash, without_protection: true)
    bug.number = args[1]
    bug.save
  end
end
