# frozen_string_literal: true

class SessionController < DeviseSessions::Controller
  def destroy
    sign_out(current_user)
    redirect_to root_path
  end
end
