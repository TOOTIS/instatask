class BugsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # POST /bugs
  def add
  	if Bug.new(bug_params).valid?
  	  @number = [4,6,67,7,4,2,1].sample
		else
	  	raise ActionController::ParameterMissing
    end
  end

  private

  def bug_params
    params.require(:bug).permit(
    	:application_token,
    	:priority,
    	state_attributes: [:device, :os, :memory, :storage]
    )
  end
end
