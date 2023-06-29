class PostsController < ApplicationController
  def index
    @user = User.includes(posts: :comments).find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @current_user = current_user
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.comment_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.includes(:user, comments: :user).find(params[:id])
    @user = @post.user
    @comments = @post.comments
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
