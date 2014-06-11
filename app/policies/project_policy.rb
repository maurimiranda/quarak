class ProjectPolicy < Struct.new(:user, :project)
  class Scope < Struct.new(:user, :scope)
    def resolve
      user.projects
    end
  end

  def show?
    project.members.include? user
  end
end
