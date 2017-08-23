class ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :destroy]

  def index
    @projects = Project.where(user: current_user)
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      # render json: @project, status: 201
    else
      # render json: {errors: @project.errors.full_messages}, status: 422
    end
  end

  def update
    if @project.update_attributes(project_params)
      render json: @project, status: 200
    else
      render json: {errors: @project.errors.full_messages}, status: 422
    end
  end

  def destroy
    @project.destroy
    render json: {status: 204}
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title)
    end
end
