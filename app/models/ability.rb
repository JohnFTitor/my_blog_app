# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :delete, Post, author_id: user.id
    can :delete, Comment, author_id: user.id
    return unless user.admin?
    can :delete, Post
    can :delete, Comment
  end
end
