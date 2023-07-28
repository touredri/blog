# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @recent_posts = @user.user_recent_posts
  end
end
