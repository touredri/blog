# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_user
    # will be available in all controllers
    User.first
  end
end
