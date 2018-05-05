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
	price: 26.00,
	locale: 'en'
)

Product.create(
  title: 'Python',
	description:
	%{
		<p>Python Crash Course is a fast-paced, thorough introduction 
		to programming with Python that will have you writing programs, 
		solving problems, and making things that work in no time.</p>

		<p>In the first half of the book, you’ll learn about basic programming 
		concepts, such as lists, dictionaries, classes, and loops, and practice 
		writing clean and readable code with exercises for each topic. 
		You’ll also learn how to make your programs interactive and how 
		to test your code safely before adding it to a project. 
		In the second half of the book, you’ll put your new knowledge into 
		practice with three substantial projects: a Space Invaders-inspired 
		arcade game, data visualizations with Python’s super-handy libraries, 
		and a simple web app you can deploy online.</p>
	},
	image_url: 'python.jpg',
	price: 16.00,
	locale: 'en'
)

Product.create(
  title: 'Ruby is our friend',
	description:
	%{
		<p>This book is a tutorial and reference for the <i>Ruby programming language</i>. 
		Use Ruby, and you'll write better code, be more productive, 
		and enjoy programming more.</p>

		<p>These are bold claims, but we think that after reading this book you'll 
		agree with them. And we have the experience to back up this belief.</p>

		<p>As <i>Pragmatic Programmers</i> we've tried many, many languages in our 
		search for tools to make our lives easier, for tools to help us do 
		our jobs better. Until now, though, we'd always been frustrated 
		by the languages we were using.</p>
	},
	image_url: 'ruby.jpg',
	price: 31.00,
	locale: 'en'
)