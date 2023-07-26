# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts.includes(:comments)
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @post_comments = @post.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.save
    if @post.save
      redirect_to :root
      flash[:success] = 'Post created!'
    else
      flash[:error] = 'Post not created!'
      render :new
    end
  end
end
