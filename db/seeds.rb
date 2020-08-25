# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@shelter1 = Shelter.create(name: "Van's pet shop", address: "3724 tennessee dr", city: "Rockford", state: "Illinois", zip: "61108")
@shelter2 = Shelter.create(name: "Bovice's pet shop", address: "37 ed vera dr", city: "Rockford", state: "Illinois", zip: "61109")
@shelter1.pets.create(image: "Bellas-pic", name: "Bella", age: "5", sex: "female", description: "Fun Loving Dog")
@shelter1.pets.create(image: "maisys-pic", name: "Maisy", age: "6", sex: "female", description: "Stomache on legs")
@shelter2.pets.create(image: "Mr.cats-pic", name: "Mr. Cat", age: "9", sex: "male", description: "Has Russian accent")
@shelter2.pets.create(image: "franks-pic", name: "Frank", age: "3", sex: "male", description: "He's a snake. does snake things")
@shelter1.reviews.create(title: "Best Place In Town",
                          rating: 3,
                          content: "We went here to find our new best friend and we were successful. Yay.",
                          image: "")
@shelter1.reviews.create( title: "Smells like cheese",
                          rating: 1,
                          content: "Do they ever clean this place?!",
                          image: "https://www.gannett-cdn.com/presto/2019/10/03/USAT/a027273c-4c89-44fb-b896-d0121a3814a8-ANIMALKIND_GUILTY_GOLDEN_DESK_THUMB.jpg")
