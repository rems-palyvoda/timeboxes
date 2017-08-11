class ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :destroy]

  def index
    @projects = Project.all
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      # render json: @project, status: 201
    else
      # render json: {errors: @project.errors.full_messages}, status: 422
    end
  end

  def update
    if @project.update(project_params)
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
