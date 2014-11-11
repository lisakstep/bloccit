class CommentPolicy < ApplicationPolicy
  def destroy?
    user.present? && (user.moderator? || record.user == user || user.admin? )
  end
  
end