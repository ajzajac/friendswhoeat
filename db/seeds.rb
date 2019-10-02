# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Ram", email: "ram@ram.com", password: "ram")
User.create(name: "Andrew", email: "andrew@andrew.com", password: "andrew")
User.create(name: "Ramdrew", email: "ramdrew@ramdrew.com", password: "ramdrew")
User.create(name: "DrewRam", email: "rdrewam@drewram.com", password: "drewram")
User.create(name: "Werdna", email: "werdna@werdna.com", password: "wernda")
User.create(name: "Mar", email: "mar@mar.com", password: "mar")
Restaurant.create(name: "Shake Shack", cuisine: "Fast Food", location: "New York", rating: 5.0)
Restaurant.create(name: "McDonalds", cuisine: "Fast Food", location: "New Hampshire", rating: 3.0)
Restaurant.create(name: "Wendys", cuisine: "Fast Food", location: "Brooklyn", rating: 3.0)
Restaurant.create(name: "Cheesecake Factory", cuisine: "Dinner", location: "Florida", rating: 5.0)
Restaurant.create(name: "Red Lobster", cuisine: "Seafood", location: "Jamaica", rating: 2.0)
Restaurant.create(name: "Olive Garden", cuisine: "Italian", location: "Antarctica", rating: 2.0)
Restaurant.create(name: "PF Changs", cuisine: "Chinese", location: "Zimbabwe", rating: 4.0)
Restaurant.create(name: "Pizza Hut", cuisine: "Pizza", location: "California", rating: 4.0)

Review.create(description: "Very Nice", rating: 4.5, restaurant_id: 1, user_id: 1)
Review.create(description: "Very Bad", rating: 1.5, restaurant_id: 2, user_id: 2)
Review.create(description: "Very Good", rating: 5.0, restaurant_id: 3, user_id: 3)
Review.create(description: "Very Horrible", rating: 1.0, restaurant_id: 2, user_id: 4)
Review.create(description: "Very Not Nice", rating: 2.0, restaurant_id: 1, user_id: 5)
Review.create(description: "Very Nasty", rating: 0.5, restaurant_id: 4, user_id: 4)
Review.create(description: "Very Dirty", rating: 0.0, restaurant_id: 5, user_id: 3)
Review.create(description: "Very Cool", rating: 5.0, restaurant_id: 5, user_id: 6)
