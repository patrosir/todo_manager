class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def new
    render "new"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where(["email = ? and password = ?", email, password])[0]
    if user
      render plain: true
    else
      render plain: false
    end
  end
end
