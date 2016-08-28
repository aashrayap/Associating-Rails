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


  def whitelisted_params
    params.require(:post).permit(:title,:body,
                                    :comments_attributes =>
                                    [:body])
  end

end

