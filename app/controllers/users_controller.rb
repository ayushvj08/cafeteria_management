class UsersController < ApplicationController
  before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in, :only => [:new, :create, :reset_password_form, :reset_password]

  def index
    @users = User.all
  end

  def new
    @new_user = User.new
    @new_user[:role] = params[:role]
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    role = params[:role]

    # Exception handling
    if role == ""
      role = "customer"
    end

    @new_user = User.new(
      name: name,
      email: email,
      password: password,
      role: role,
    )

    if @new_user.save
      flash[:msg] = "Account successfully created! Please login to continue."
      redirect_to new_sessions_path
    else
      flash[:error] = @new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @new_user = User.find(params[:id])
  end

  def update
    # @new_user.save!
    # Root
    if params[:email] == "admin@email.com"
      flash[:error] == "This is root admin! you can't change his login credentials"
      redirect_to users_path
    else
      @user = User.find(params[:id])
      @user.name = params[:name]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.role = params[:role]
      if @user.save && @user.role == "customer"
        flash[:msg] = "Password Updated successfully."
        redirect_to cafe_path
      elsif @user.save
        flash[:msg] = "User has been Updated."
        redirect_to users_path
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to users_path
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def reset_password_form
    if session[:current_user_id]
      redirect_to "/"
    else
      @user = User.find_by(email: params[:email])
    end
  end

  def reset_password
    @user = User.find_by(email: params[:email])
    if params[:password] == params[:confirm_password]
      @user.password = params[:password]
      if @user.save
        flash[:msg] = "Password Updated Successfully. Log-in to continue!"
        redirect_to new_sessions_path
      end
    else
      flash[:error] = "Both Passwords don't match. Make sure to type them correctly"
      redirect_to "/"
    end
  end
end
