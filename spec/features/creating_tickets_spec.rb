require 'rails_helper'


RSpec.feature "Users create new ticket" do
  let(:user) { FactoryBot.create(:user) } 
  before do
    login_as(user)
    project = FactoryBot.create :project, name: "Google Chrome"
    
    visit project_path(project)
    click_link "New Ticket"
  end
  
  scenario "with valid attributes" do
    fill_in "Name",	with: "Consuming too much memory"
    fill_in "Description",	with: "Opening multiple program become slow" 
    click_button "Create Ticket"
    
    expect(page).to  have_content "Ticket has been created"
    within(".ticket") do
      expect(page).to have_content "Author: #{user.email}" 
    end
    
  end
  
  scenario "with invalid attributes" do
    click_button "Create Ticket"
    
    expect(page).to  have_content "Ticket not created"
    expect(page).to  have_content "Name can't be blank"
    expect(page).to  have_content "Description can't be blank"
    
  end
  
  scenario "with invalid description" do
    fill_in "Description",	with: "short" 
    click_button "Create Ticket"
    
    expect(page).to  have_content "Ticket not created"
    expect(page).to  have_content "Description is too short"
    
  end
  
end