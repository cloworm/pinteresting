module ApplicationHelper

  # Return the given user's name, or "you" if the given user is the current_user.
  def casual_user_name(user)
    user == current_user ? "you" : user.name
  end

end
