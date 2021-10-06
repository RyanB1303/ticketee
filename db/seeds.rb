unless User.exists?(email: "admin@ticketee.com")
  User.create!(email: "admin@ticketee.com", password: "password", admin: true)
end

["Visual Studio Code", "Internet Explorer"].each do | name |
  unless Project.exists?(name: name)
    Project.create!(name: name, description: "A Sample project about #{name}")
  end

end

unless State.exists?
  State.create name: "New", color: "#0066CC", default: true
  State.create name: "Open", color: "#008000"
  State.create name: "Closed", color: "#990000"
  State.create name: "Awesome", color: "#663399"
end