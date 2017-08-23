require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before do
    @user = create(:user)
    @project = Project.create(title: "Project", user: @user)
    sign_in @user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @posts" do
      get :index
      expect(assigns(:projects)).to match_array([@project])
    end

    it "shows projects belongs current user only" do
      user = create :user, email: "user2@example.com"
      @smb_project = Project.create title: "title", user_id: user
      get :index
      expect(assigns(:projects)).to match_array([@project])
      expect(assigns(:projects)).not_to match_array([@smb_project])
    end
  end

  describe "POST #create" do
    it "creates new project with valid title" do
      post :create, xhr: true, params: {project: {title: "Project 2"}}
      expect(Project.count).to eql(2)
    end

    it "doesn't create project of title is empty" do
      post :create, xhr: true, params: {project: {title: ""}}
      expect(Project.count).to eql(1)
    end
  end

  describe "PUT #update" do
    it "update new project with valid title" do
      put :update, xhr: true, params: {id: @project.id, project: {title: "Updated"}}
      @project.reload
      expect(@project.title).to eql("Updated")
    end

    it "doesn't create project of title is empty" do
      put :update, xhr: true, params: {id: @project.id, project: {title: ""}}
      @project.reload
      expect(@project.title).to eql("Project")
    end
  end

  describe "DELETE #destroy" do
    it "should destroy Project" do
      delete :destroy, xhr: true, params: {id: @project.id}
      expect(Project.count).to eql(0)
    end
  end
end
