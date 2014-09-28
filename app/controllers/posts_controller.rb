class PostsController < ApplicationController
  def new
  	# @post = Post.new
  end

  def index
  	@post = Post.all
  end

  def create
    user = User.find_by name:params[:user]

  	@post = Post.new(:title=>params[:title],:body=>params[:body])
    @post.user_id = user.id

    logger.debug(@post)

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
