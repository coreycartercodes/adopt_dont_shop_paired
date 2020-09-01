# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@shelter1 = Shelter.create(name: "Van's pet shop", address: "3724 tennessee dr", city: "Rockford", state: "Illinois", zip: "61108")
@shelter2 = Shelter.create(name: "Bovice's pet shop", address: "37 ed vera dr", city: "Rockford", state: "Illinois", zip: "61109")
@shelter1.pets.create(image: "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg", name: "Bella", age: "5", sex: "female", description: "Fun Loving Dog")
@shelter1.pets.create(image: "https://static.insider.com/image/5d24d6b921a861093e71fef3.jpg", name: "Maisy", age: "6", sex: "female", description: "Stomache on legs")
@shelter2.pets.create(image: "https://media.wired.com/photos/5cdefb92b86e041493d389df/master/pass/Culture-Grumpy-Cat-487386121.jpg", name: "Mr. Cat", age: "9", sex: "male", description: "Has Russian accent")
@shelter2.pets.create(image: "https://i.dailymail.co.uk/1s/2020/03/20/13/26207684-0-image-a-4_1584711978894.jpg", name: "Frank", age: "3", sex: "male", description: "He's a snake. does snake things")
@shelter1.reviews.create(title: "Best Place In Town",
                          rating: 3,
                          content: "We went here to find our new best friend and we were successful. Yay.",
                          image: "")
@shelter1.reviews.create( title: "Smells like cheese",
                          rating: 1,
                          content: "Do they ever clean this place?!",
                          image: "https://www.gannett-cdn.com/presto/2019/10/03/USAT/a027273c-4c89-44fb-b896-d0121a3814a8-ANIMALKIND_GUILTY_GOLDEN_DESK_THUMB.jpg")
