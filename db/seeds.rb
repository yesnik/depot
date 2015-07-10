# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#---
# Excerpted from "Agile Web Development with Rails 3.2",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails32 for more book information.
#---
# encoding: utf-8

#Product.delete_all
Product.create(
  title: 'CoffeeScript',
  description: 
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
    functionality wrapped in a cleaner, more succinct syntax. In the first
    book on this exciting new language, CoffeeScript guru Trevor Burnham
    shows you how to hold onto all the power and flexibility of JavaScript
    while writing clearer, cleaner, and safer code.
      </p>},
  image_url:   'cs.jpg',    
  price: 36.00,
  locale: 'en'
)

Product.create(
  title: 'Programming Ruby 1.9',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  image_url: 'ruby.jpg',
  price: 49.95,
  locale: 'en'
)

Product.create(
  title: 'Rails Test Prescriptions',
  description: 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  image_url: 'rtp.jpg',
  price: 34.95,
  locale: 'en'
)

Product.create(
    title: 'Психология продаж',
    description:
        %{Это отличнейшая книга по психологии продаж.},
    image_url: 'http://img1.labirint.ru/books/397088/big.jpg',
    price: 263.50,
    locale: 'ru'
)

Product.create(
    title: 'Программируем на python',
    description:
        %{Это отличнейшая книга по программированию на python.},
    image_url: 'https://realpython.com/learn/python-first-steps/images/pythonlogo.jpg',
    price: 263.50,
    locale: 'ru'
)

begin
  PaymentType.destroy_all
  credit_card = PaymentType.create title: 'credit_card'
  cash = PaymentType.create title: 'cash'
  check = PaymentType.create title: 'check'

  Order.create(name: 'Johny', email: 'johny@mail.ru',
               address: 'Main Street, 12', payment_type: credit_card)

  Order.create(name: 'Leo', email: 'leo@mail.ru',
               address: 'Laurence Street, 112', payment_type: cash)

  Order.create(name: 'Mike', email: 'mike@ya.ru',
               address: 'Loft Street, 41', payment_type: check)

rescue StandardError => e
  puts "It seems payment_types exist already in DB:\n#{e}\n"
end

Order.create

# Создаем пользователя для админки
User.create(name: 'admin', password: 'admin', password_confirmation: 'admin')