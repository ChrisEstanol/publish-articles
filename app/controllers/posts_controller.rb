class PostsController < ApplicationController
  # see note at the bottom
  # before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(allowed_params)
    # @post.title = params[:post][:title]
    # @post.published = params[:post][:published]
    # @post.author = params[:post][:author]
    # @post.content = params[:post][:content]
    # This is equivalent to using rails c and entering
    # parameters manualy

    # if @post.save
    #   redirect_to @post, notice: 'Post was successfully created.'
    # else
    #   render action: 'new'
    # end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id], allowed_params)
    # if @post.update(allowed_params)
    #   redirect_to @post, notice: 'Post was successfully updated.'
    # else
    #   render action: 'edit'
    # end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully deleted.'
  end

#  only allow the white list through.
  def allowed_params
    params.require(:post).permit([:title, :author, :content, :published])
  end

# we have the option to define a method that use the code we repeat
# we then declare it with before action
# private
#   def set_post
#     @post = Post.find(params[:id])
#   end


end
