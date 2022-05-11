class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    can :read, :all
    return unless user.admin?

    can :delete, Post
    can :delete, Comment
  end
end
