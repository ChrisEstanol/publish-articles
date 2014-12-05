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
    @post = Post.new(allowed_params)
    # @post.title = params[:post][:title]
    # @post.published = params[:post][:published]
    # @post.author = params[:post][:author]
    # @post.content = params[:post][:content]
    # This is equivalent to using rails c and entering
    # parameters manualy

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
    if @post.update(allowed_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully deleted.'
  end

  def allowed_params
    params.require(:post).permit([:title, :author, :content, :published])
  end

end
