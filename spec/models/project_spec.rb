require 'rails_helper'

RSpec.describe Project, type: :model do
  before { @project = Project.new(title: "Project 1") }

  subject { @project }

  it { should respond_to(:title) }
  it { should validate_presence_of(:title) }
        
  # it { should have_many(:tasks) }

  it { should be_valid }
end
