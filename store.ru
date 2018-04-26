require 'rubygems'

# Init Bundler, which will make available the right versions 
# of all required gems
require 'bundler/setup'

require './scripts/store'

use Rack::ShowExceptions

map '/store' do
  run StoreApp.new
end
