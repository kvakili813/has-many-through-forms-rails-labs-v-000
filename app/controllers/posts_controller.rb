class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def update
    byebug
    @post = Post.find(params[:id])
    @post = Post.update(post_params[:comment_attributes])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids: [], categories_attributes: [:name], comments_attributes: [])
  end
end
