class JobPolicy < ApplicationPolicy

  def index?
    record.user == user
  end
  
  def show?
    record.user == user
  end
  
  def new?
    show?
  end
  
  def create?
    show?
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    show?
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
