class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    return unless user

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    can :manage, Like, author_id: user.id

    return unless user.admin?

    can :delete, Post
    can :delete, Comment
  end
end
