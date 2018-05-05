# Depot - Ruby on Rails Store

This application was developed using materials of the book "Agile Web Development with Rails 5" by Sam Ruby.

## Installation

* Connect to PostgreSQL database

```
sudo -u postgres psql
```

* Create user `depot`

```
CREATE USER depot WITH CREATEDB PASSWORD '123';
```

* Copy file `.env.sample` to file `.env` and ensure that your DB credentials are correct in this file:

```
DB_USERNAME=depot
DB_PASSWORD=123
DB_HOST=localhost
```

* Clone this repository

```
git clone git@github.com:yesnik/depot.git
```

* Install dependencies

```
cd depot
bundle install
```

* Create database, run migrations and apply seeds

```
rails db:setup
```

* Run development server

```
rails s
```

* Visit site 

  - Public area: http://0.0.0.0:3000/

  - Admin area (any login/password for the first time): http://0.0.0.0:3000/

