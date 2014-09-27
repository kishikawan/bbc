class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def index
  	@post = Post.all
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to posts_url
  	else
  		render 'new'
  	end
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :body)
  	end
end
