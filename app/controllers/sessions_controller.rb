class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def forgot_password
  end

  def reset_password
    @user_email = params[:email]
    if !User.find_by(email: @user_email)
      flash[:error] = "This isn't a valid email! Please consider Signing-up Instead."
      redirect_to "/"
    else
      UserMailer.with(email: @user_email).reset_password_email.deliver_now
      flash[:msg] = "Password Reset email sent."
      redirect_to "/"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      flash[:msg] = "Welcome Back #{user.name}!"
      redirect_to "/"
    else
      # render plain: "Incorrect password"
      flash[:error] = "Your Login attempt was Invalid. Please retry"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
