class SessionsController < ApplicationController
  def create

    s = Session.new create_params
    s.validate
    render_resource s
    session[:current_user_id] = s.user.id
    $redis.setex "1", 10, "2122"
    # p $redis.get 1
  end


  def destory
    session[:current_user_id] = nil
    head :ok

  end

  def create_params
    params.permit(:email, :password)
  end
end
