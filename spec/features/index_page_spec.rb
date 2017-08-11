require 'rails_helper'

RSpec.describe 'index page', type: :feature, js: true do
  before do
    Project.create title: "Testing Project"
    user = create(:user)
    login_as(user, :scope => :user)
    visit '/'
  end

  it 'has form for create new project' do
    expect(page).to have_selector('input#project_title')
    expect(page).to have_selector('input[type="submit"]')
  end
  
  it 'form creates new project' do
    expect(page).to have_selector('.alert', visible: false)
    fill_in('project[title]', with: 'test project')
    click_on('New Project')
    expect(page).to have_content('test project')
    expect(page).to have_css('.projects-list')
    expect(page).to have_css('.project-item', count: 2)
    expect(page).to have_selector('.alert', visible: true)
    expect(page).to have_content('Project created')
  end
end
