# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# encoding: utf-8
Product.delete_all
Product.create(title: 'CoffeeScript',
               description:
                   %{
        CoffeeScript is JavaScript done right.
      },
               image_url:   '5.jpg',
               price: 36.00)
# . . .
Product.create(title: 'Programming Ruby 1.9 & 2.0',
               description:
                   %{
        CoffeeScript is JavaScript done right.

      },
               image_url: '6.jpg',
               price: 49.95)
# . . .

Product.create(title: 'Rails T123est Prescriptions',
               description:
                   %{
        rovides all of JavaScript's
	functionality wrapped in a cleaner,

     },
               image_url: '7.jpg',
               price: 34.95)

# . . .

Product.create(title: 'Rails 123Test Prescriptions',
               description:
                   %{
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner,

     },
               image_url: '8.jpg',
               price: 34.95)

