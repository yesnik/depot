# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Product.create(
  title: 'Simple PHP',
	description:
	%{<p>
	This is a nice book about PHP
	</p>},
	image_url: 'php.jpg',
	price: 26.00
)

Product.create(
  title: 'Python',
	description:
	%{<p>
	This is a nice book about Python.
	},
	image_url: 'python.jpg',
	price: 16.00
)

Product.create(
  title: 'Ruby is our friend',
	description:
	%{<p>
	This is a great book about Ruby programming language.
	We are sure that you'll like it!
	</p>},
	image_url: 'ruby.jpg',
	price: 31.00
)