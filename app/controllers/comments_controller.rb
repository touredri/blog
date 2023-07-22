# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def comment_params
    # code here
    params.require(:comment).permit(:text)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      flash[:success] = 'Comment create with success!'
      redirect_to user_post_path(@current_user, @post)
    else
      flash[:error] = 'Comment not created!'
      render :new
    end
  end
end
