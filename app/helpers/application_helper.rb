module ApplicationHelper
  def author_name(user)
    return unless user
    if current_user.dude.able_to_see_user_full_name?(user)
      user.name
    else
      first_letter = user.name[0]
      "#{first_letter}."
    end
  end
end
