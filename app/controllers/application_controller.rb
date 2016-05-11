class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::ParameterMissing, with: -> { render_400 }

  def render_400
  	render(file: 'errors/400.json', status: 400, layout: false) and return
  end
end
