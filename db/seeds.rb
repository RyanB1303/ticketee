unless User.exists?(email: "admin@ticketee.com")
  User.create!(email: "admin@ticketee.com", password: "password", admin: true)
end

["Visual Studio Code", "Internet Explorer"].each do | name |
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A Sample project about #{name}")
  end

end