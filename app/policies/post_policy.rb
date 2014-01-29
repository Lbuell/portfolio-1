class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def resolve
    scope
  end

  def update?
    @user.author?
  end

  def destroy?
    @user.author? || @user.editor?
  end

  def publish?
    @user.editor?
  end
end