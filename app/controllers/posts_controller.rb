  class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.new(whitelisted_params)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

    def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(whitelisted_params)
      redirect_to action: :index
    else
      render :edit
    end
  end


  def whitelisted_params
    params.require(:post).permit(:title,:body,
                                    :comments_attributes =>
                                    [:body])
  end

end

