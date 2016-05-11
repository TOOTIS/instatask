class BugsWorker
  include Sidekiq::Worker

  def perform(*args)
  	bug = Bug.new(eval(args[0]), without_protection: true)
  	bug.number = args[1]
  	bug.save
  end
end