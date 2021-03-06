require 'rails_helper'

RSpec.describe ProjectsController do

  it "handles a missing project nicely" do
    get project_path("not-here")
    expect(response).to redirect_to(projects_path)
    
    message = "The project you are looking for could not be found"
    expect(flash[:alert]).to eq message
  end
  

end
