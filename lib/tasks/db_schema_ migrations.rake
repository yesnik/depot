#encoding: utf-8

namespace :db do
  desc "Эта задача выводит примененные версии миграций "
  task :schema_migrations => :environment do
    puts ActiveRecord::Base.connection.select_values 'select version from schema_migrations order by version'
  end
end
