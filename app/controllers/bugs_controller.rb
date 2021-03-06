class BugsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # POST /bugs
  def add
    b = Bug.new(bug_params)
    raise ActionController::BadRequest unless b.valid?
    @number = Bug.increment_number(b.application_token)
    BugsWorker.perform_async(bug_params.to_hash, @number)
  end

  # GET /bugs/count
  def count
    @count = Bug.count(params[:application_token])
    raise ActiveRecord::RecordNotFound unless @count
  end

  # GET /bugs/:application_token/:number
  def get
    if !Bug.cached?(params[:application_token]) ||
       Bug.count(params[:application_token]).to_i < params[:number].to_i
      raise ActiveRecord::RecordNotFound
    end

    @bug = Bug.includes(:state).find_by(
      application_token: params[:application_token],
      number: params[:number]
    )
  end

  private

  def bug_params
    params.require(:bug).permit(
      :application_token,
      :status,
      :priority,
      state_attributes: [:device, :os, :memory, :storage]
    )
  end
end
