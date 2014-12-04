class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(params[:id])
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(params[:id])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy(params[:id])
    redirect_to @post, notice: 'Post was successfully deleted.'
  end

end
