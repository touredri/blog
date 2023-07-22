# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: @user)
    @post_comments = Comment.where(post_id: @user_posts.ids)
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = Comment.where(post_id: @post)
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
