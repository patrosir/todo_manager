class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def index
    render plain: User.order(:id).map { |user| user.to_pleasent_string }.join("\n")
  end

  def create
    user = User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    session[:current_user_id] = user.id
    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    user_exists = User.exists?(email: email, password: password)
    render plain: "#{user_exists}"
  end
end
