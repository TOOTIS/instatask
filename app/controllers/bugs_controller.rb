class BugsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # POST /bugs
  def add
    b = Bug.new(bug_params)
  	if b.valid?
      @number = Bug.increment_number(b.application_token)
      BugsWorker.perform_async(bug_params.to_s, @number)
		else
	  	raise ActionController::BadRequest
    end
  end

  # # GET /bugs/count
  # def count
  #   @count = Bug.count(params[:application_token])
  # end

  private

  def bug_params
    params.require(:bug).permit(
    	:application_token,
    	:priority,
    	state_attributes: [:device, :os, :memory, :storage]
    )
  end
end
