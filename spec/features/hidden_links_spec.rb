require 'rails_helper'

RSpec.feature "Users can only see appropriate links" do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, :admin) } 
  let(:project) { FactoryBot.create(:project) }
  
  context "anonymouse users" do
    scenario "cannot see Project Link" do
      visit "/"
      expect(page).not_to have_link "New Project"
    end
    
    scenario "cannot see the edit project link" do
      visit project_path(project)
      expect(page).not_to have_link "Edit Project" 
    end
    
    scenario "cannot see the delete project link" do
      visit project_path(project)
      expect(page).not_to have_link "Delete Project" 
    end
  end
  
  context "regular users" do
    before { login_as(user) }
    scenario "cannot see Project Link" do
      visit "/"
      expect(page).not_to  have_link "New Project"
    end
    
    scenario "cannot see the edit project link" do
      visit project_path(project)
      expect(page).not_to have_link "Edit Project" 
    end
    
    scenario "cannot see the delete project link" do
      visit project_path(project)
      expect(page).not_to have_link "Delete Project" 
    end
  end
  
  context "admin users" do
    before { login_as(admin) }
    scenario "can see Project Link" do
      visit "/"
      expect(page).to  have_link "New Project"
    end
    
    scenario "can see the edit project link" do
      visit project_path(project)
      expect(page).to have_link "Edit Project" 
    end
    
    scenario "can see the delete project link" do
      visit project_path(project)
      expect(page).to have_link "Delete Project" 
    end
  end

end