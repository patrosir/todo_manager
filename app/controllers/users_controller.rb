class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "new"
  end

  def index
    render plain: User.order(:id).map { |user| user.to_pleasent_string }.join("\n")
  end

  def create
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to todos_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
