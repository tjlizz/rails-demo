class ApplicationController < ActionController::API
  def render_resource(resource)
    if resource.errors.empty?
      render json: {resource: resource}, status: 200
    else
      render json: {errors: resource.errors}, status: 400
    end
  end

  def current_user
    @current_user ||= User.find_by_id session[:current_user_id]
  end

end
