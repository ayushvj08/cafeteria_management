class UsersController < ApplicationController
  before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def index
    if current_user
      @users = User.all
      render "index"
    else
      redirect_to "/"
    end
  end

  def new
    @new_user = User.new
    @new_user[:role] = params[:role]
    if @current_user
      render "new"
    else
      render "new", layout: false
    end
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
      redirect_to "/cafe"
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
    @user = User.find(params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.role = params[:role]
    if @user.save
      redirect_to users_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def login
    email = params[:email]
    password = params[:password]
    if User.find_by(email: email, password: password)
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
