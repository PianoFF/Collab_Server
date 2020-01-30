class PostsController < ApplicationController
  before_action :authorized_only_action
  def create
    post = Post.create(post_params)
    post.update(user: @current_user)

    if post.valid? 
      render json: post 
    else 
      render json: { errors: post.errors.full_messages }, status: :not_acceptable
    end
  end


  private

  def authorized_only_action
    if !logged_in?
      render json: { errors: 'You must log in to proceed' }, status: :unauthorized  
    end
  end

  def post_params
    params.require(:post).permit(:title, :post_type, :content, :repertoire)
  end
end
