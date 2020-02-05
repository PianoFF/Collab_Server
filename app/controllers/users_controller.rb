class UsersController < ApplicationController

  def signup
    user = User.create(user_params)

    if user.valid? 
      # render json: { user: UserSerializer.new(user), token: issue_token(user_id: user.id) }, status: :accepted
      # refactored after moving issue_token to user.rb
      render json: user 
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



  def validate 
    #sending localStorage.token to validate if a user's already logged in; if there's a logged in user, it'll send back user object
    if logged_in?
      # render json: { user: UserSerializer.new(@current_user), token: issue_token(user_id: @current_user.id) }, status: :accepted
      # refactored after moving issue_token to user.rb
      render json: @current_user 
    else
      render json: { error: "Please try again" }, status: :not_acceptable
    end
  end

  def index
    users = User.all 
    render json: users 
  end 

  def show
    user = User.find(params[:id])
    if user 
      render json:user 
    else
      render json: { error: "We can't find who you are looking for" }, status:404 
    end
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :bio_content, :field)
  end
end
