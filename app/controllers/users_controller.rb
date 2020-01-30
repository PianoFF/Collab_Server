class UsersController < ApplicationController

  def create
    user = User.create(user_params)

    if user.valid? 
      render json: { user: user, token: issue_token(user_id: user.id) }, status: :accepted
    else
      render json: { errors: user.errors.full_messages }, status: :unauthorized
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
