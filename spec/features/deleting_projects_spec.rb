require 'rails_helper'

RSpec.feature "Users can delete an existing projects" do
  
  scenario "success delete" do
    FactoryBot.create :project, name: "Deleted Project"
    
    visit "/"
    click_link "Deleted Project"
    click_link "Delete Project"
    
    expect(page).to have_content "Project has been deleted"
    
  end
  
  
end