class UsersController < ApplicationController

  def create
    user = User.create(user_params)

    if user.valid? 
      render json: user 
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end


  def login
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      render json: user
    else
      render json: { error: "Please try again" }, status: :not_acceptable
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :bio_content, :field)
  end
end
