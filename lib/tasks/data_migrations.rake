namespace :data_migrations do
  desc "Migrate single to many attachments"
  task update_attachments: :environment do
    ActiveStorage::Attachment.where(name: "attachments")
  end
end