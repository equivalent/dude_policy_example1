class ArticlePolicy < DudePolicy::BasePolicy
  # admin and author can update article
  def able_to_update_article?(dude:)
    return true if dude.admin?
    return true if dude == resource.author
    false
  end

  # only author can delete article
  def able_to_delete_article?(dude:)
    return true if dude == resource.author
    false
  end
end

