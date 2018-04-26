namespace :db do
  desc "Backup the development database"
  task backup: :environment do
    backup_dir = ENV['DIR'] || File.join(Rails.root, 'db', 'backup')
    dest = File.join(backup_dir, "database.backup.sql")

    makedirs backup_dir, :verbose => true

    require 'shellwords'

    sh "PGPASSWORD=123 pg_dump -U depot -d depot_development -h localhost > #{Shellwords.escape dest}"
  end
end
