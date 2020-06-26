class UsersController < ApplicationController
  def create
    user = User.create create_params
    render_resource user

  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end

  def me
    user = current_user
    if user.nil?
      head 404
    else
      render_resource user
    end
  end

  def forget
    user = User.find_by_email params[:email]
    if user
      uuid = SecureRandom.uuid
      Core.add_redis uuid, user.id
      render json: {password_voucher: uuid}
    else
      render json: {errors: "邮箱不存在"}, status: 404
    end
  end

end
