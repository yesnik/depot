namespace :db do
  desc "Prints the migrated versions"
  task :schema_migrations => :environment do
    puts ActiveRecord::Base.connection.select_values(
      'SELECT version FROM schema_migrations ORDER BY version'
    )
  end
end
