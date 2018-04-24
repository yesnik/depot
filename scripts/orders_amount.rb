require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'depot_development',
  user: 'depot',
  password: '123',
  host: 'localhost'
)

class Order < ActiveRecord::Base; end

p Order.count
