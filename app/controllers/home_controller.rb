class HomeController < ApplicationController
  before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def index
    # @current_user_id = session[:current_user_id]
    if current_user
      redirect_to cafe_path
    else
      render "index"
    end
  end
end
