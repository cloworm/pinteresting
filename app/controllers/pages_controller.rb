class PagesController < ApplicationController
  def home
  end

  def about
  end

  def please_sign_in
    redirect_to new_user_session_path, notice: "Please sign in first"
  end
end
