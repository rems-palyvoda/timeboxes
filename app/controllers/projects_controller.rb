class ProjectsController < ApplicationController
  before_action :set_project, only: [:update, :destroy]

  def index
    @project = Project.new
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project is created."
      render json: @project, status: 201 
    else
      render json: {errors: @project.errors.full_messages}, status: 422
      flash[:danger] = "Project isn't created."
    end
  end

  def update
    if @project.update(project_params)
      render json: @project, status: 201
      flash[:success] = "Project is created."
    else
      render json: {errors: @project.errors.full_messages}, status: 422
      flash[:danger] = "Project isn't created."
    end
  end

  def destroy
    @project.destroy
    head 204
    flash[:success] = "Project is deleted."
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title)
    end
end
