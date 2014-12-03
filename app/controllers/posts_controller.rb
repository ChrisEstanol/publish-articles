class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(params[:id])

    @post.save
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
