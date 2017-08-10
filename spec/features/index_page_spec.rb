require 'rails_helper'

RSpec.describe 'index page', type: :feature do
  before do
    Project.create title: "Testing Project"
    visit '/'
  end

  it 'has form for create new project' do
    expect(page).to have_selector('input#project_title')
    expect(page).to have_selector('input[type="submit"]')
  end
  
  it 'form creates new project' do
    fill_in('project[title]', with: 'test project')
    click_on('New Project')
    visit '/'
    expect(page).to have_content('test project')
    expect(page).to have_css('.projects-list')
    expect(page).to have_css('.project-item', count: 2)
  end
end
