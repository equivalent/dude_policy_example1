class UserPolicy < DudePolicy::BasePolicy
  def able_to_manage_user?(dude:)
    return true if dude.admin?
    return true if dude == resource
    false
  end

  def able_to_see_user_full_name?(dude:)
    return true if dude.admin?
    return true if dude == resource
    false
  end
end
