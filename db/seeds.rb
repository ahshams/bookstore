# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# encoding: utf-8
Product.delete_all
Product.create(title: 'CoffeeScript',
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
               book_number: 'ISBN:345234')
# . . .
Product.create(title: 'Programming Ruby 1.9',
               description:
                   %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
               image_url: 'ruby.jpg',
               book_number: 'ISBN:745455',
               price: 49.95)
# . . .

Product.create(title: 'Rails Test Prescriptions',
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
               book_number: 'ISBN:645748',
               price: 34.95)
# . . .

Product.create(title: 'Ruby on Rails',
               description:
                   %{<p>
        <em>Ruby on Rails </em> is the complete environment for building awesome
         websites using Ruby programming language. The booke covers the core Rails
         testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
               image_url: 'rails.png',
               book_number: 'ISBN:235742',
               price: 55.50)