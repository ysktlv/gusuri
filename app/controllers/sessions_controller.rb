class SessionsController < ApplicationController
  def index
    redirect_to reflections_path if logged_in?
  end

  def create
    redirect_to root_path unless request.env["omniauth.auth"][:uid]
    user_data = request.env["omniauth.auth"]
    user = User.find_by(uid: user_data[:uid])
    if user
      log_in user
      redirect_to reflections_path
    else
      new_user = User.new(
        uid: user_data[:uid],
        nickname: user_data[:info][:nickname],
        name: user_data[:info][:name],
        image: user_data[:info][:image]
      )
      session[:oauth_token] = user_data[:credentials][:token]
      session[:oauth_token_secret] = user_data[:credentials][:secret]
      log_in new_user if new_user.save
      redirect_to new_goal_path
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
