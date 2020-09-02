class SessionsController < ApplicationController
  def index
  end

  def create
    unless request.env['omniauth.auth'][:uid]
      redirect_to root_path
    end
    user_data = request.env['omniauth.auth']
    user = User.find_by(uid: user_data[:uid])
    if user
      log_in user
      redirect_to reflections_path
    else
      new_user = User.new(
        uid: user_data[:uid],
        nickname: user_data[:info][:nickname],
        name: user_data[:info][:name],
        image: user_data[:info][:image],
      )
      if new_user.save
        log_in new_user
      end
      redirect_to reflections_path
    end
  end


  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
