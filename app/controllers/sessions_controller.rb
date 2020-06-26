class SessionsController < ApplicationController
  def create

    session = Session.new create_params
    p session
    session.validate
    render_resource session


  end

  def destory

  end

  def create_params
    params.permit(:email, :password)
  end
end
