class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActionController::ParameterMissing, with: -> { render_400 }
  rescue_from ArgumentError,                      with: -> { render_400 }
  rescue_from ActiveRecord::RecordNotFound,       with: -> { render_404 }
  rescue_from ActionController::RoutingError,     with: -> { render_404 }

  def render_400
  	render(file: 'errors/400.json', status: 400, layout: false) and return
  end

  def render_404
  	render(file: 'errors/404.json', status: 404, layout: false) and return
  end
end
