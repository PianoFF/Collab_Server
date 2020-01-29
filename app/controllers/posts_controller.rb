class PostsController < ApplicationController

  def create
    post = Post.create(post_params)

    if post.valid? 
      render json: post 
    else 
      render json: { errors: post.errors.full_messages }, status: :not_acceptable
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :post_type, :content, :repertoire, :user_id)
  end
end
