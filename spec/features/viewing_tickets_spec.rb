require 'rails_helper'

RSpec.feature "User can view tickets" do
  before do
    vscode = FactoryBot.create :project, name: "Visual Studio Code"
    FactoryBot.create :ticket, project: vscode, 
    name: "Make it Shiny!", description: "Gradients! Starburst! Oh my!"
    
    explorer = FactoryBot.create :project, name: "Internet Explorer"
    FactoryBot.create :ticket, project: explorer,
    name: "Standard Compliance", description: "Isn't a joke."
    
    visit "/"
  end
  
  scenario "for a given project" do
    click_link "Visual Studio Code"
    
    expect(page).to  have_content "Make it Shiny!"
    expect(page).to_not have_content "Standard Compliance"
    
    click_link "Make it Shiny!"
    within(".ticket h2") do
      expect(page).to  have_content "Make it Shiny"
    end
    
    expect(page).to  have_content "Gradients! Starburst! Oh my!"
    
    
  end
end