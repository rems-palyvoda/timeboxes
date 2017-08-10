require 'rails_helper'

RSpec.describe 'Project Actions', type: :feature, js: true do
  before do
    Project.create title: "Testing Project"
    visit '/'
  end

  it "can edit project title" do
    expect(page).to have_css('.project-title')
    find('.fa-pencil').click
    expect(page).to have_selector('input#title')
    fill_in('title', with: 'edited title')
    click_on('Edit')
    expect(page).to have_content('edited title')
  end

  it "can delete project" do
    find('.fa-trash').click
    expect(page).to_not have_content('Testing Project')
    expect(page).to_not have_css('.project-item')
  end
end
