source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0',          group: :doc



# Гем для поддержки синтаксиса Haml в представлениях
gem "haml"

# Scaffolding с использованием haml шаблонов
gem "haml-rails", "~> 0.9"

# Отображение html-форм
gem 'formtastic', '~> 3.0'

# Работа с вложениями
gem "paperclip", "~> 4.3"

group :development do
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'

  # Гем для отображещия таблиц в консоли Rails
  gem 'hirb'

  # Гем для показа отправленных сообщений в браузере
  gem "letter_opener"
end

group :development, :test do
  # Гем для поддержки Rspec-тестов
  gem 'rspec-rails', '~> 3.0'

  # Гем для деплоя
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
end

group :production do
  # Гем для использования postgres
  gem 'pg'
end

# Use ActiveModel has_secure_password
# Гем для использования шифрования паролей
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
