class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def destroy?
    user.present? && (user.moderator? || record.user == user || user.admin? )
  end
end