class PostsController < ApplicationController
  before_action :authorized_only_action
  def create
    post = Post.create(post_params)
    # post.update(user: @current_user)

    if post.valid? 
      render json: post 
    else 
      render json: { errors: post.errors.full_messages }, status: :not_acceptable
    end
  end

  def index
    posts = Post.all 
    ordered_posts =  posts.sort_by{ |post| post[:created_at]}.reverse
    render json: ordered_posts
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    render json: post 
  end

  private

  def post_params
    params.require(:post).permit(:title, :post_type, :content, :repertoire).merge(user: @current_user)
  end
end
