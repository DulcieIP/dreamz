# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Scene.destroy_all
Dream.destroy_all
User.destroy_all


puts "seeding user"

dreamer = User.new(
  email: "dreamer@lewagon.fr",
  password: "password",
)
dreamer.save!

puts "dreamer user seeded"


puts "seeding dreams"

desert = Dream.new(
  user: dreamer,
  content: "In the middle of the desert at night. I reach the edge of a dune and discover a red moon. Then i walk to the moon and catch it."
  )
desert.save!

wagon = Dream.new(
  user: dreamer,
  content: "I spend the night coding in a red Wagon"
)
wagon.save!

puts "dreams seeded"

puts "seeding scenes"

url = "https://res.cloudinary.com/dblvbc7iu/image/upload/v1678190149/DALL_E_2023-03-07_12.55.31_-_photo._I_spend_the_night_coding_in_a_red_Wagon_zcbn5u.png"
wagon_scene1 = Scene.new(
  dream: wagon,
  content: "I spend the night coding in a red Wagon",
  image_url: url
)
file = File.open("app/assets/images/seed/wagon_scene1.png")
wagon_scene1.image.attach(io: file, filename: "wagon_scene1.png", content_type: "image/png")
wagon_scene1.save!

url = "https://res.cloudinary.com/dblvbc7iu/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1678189977/DALL_E_2023-03-07_12.52.10_-_Painting._In_the_middle_of_the_desert_at_night._I_reach_the_edge_of_a_dune_and_discover_a_red_coloredmoon_The_i_walk_to_the_moon_and_catch_it._j3i3xc.jpg"
desert_scene1 = Scene.new(
  dream: wagon,
  content: "In the middle of the desert at night. I reach the edge of a dune and discover a red moon.",
  image_url: url
)
file = File.open("app/assets/images/seed/desert_scene1.png")
desert_scene1.image.attach(io: file, filename: "desert_scene1.png", content_type: "image/png")
desert_scene1.save!

url = "https://res.cloudinary.com/dblvbc7iu/image/upload/c_pad,b_auto:predominant,fl_preserve_transparency/v1678191266/DALL_E_2023-03-07_13.14.14_-_painting_I_catch_the_red_moon_zmeftg.jpg"
desert_scene2 = Scene.new(
  dream: wagon,
  content: "Then i walk to the moon and catch it.",
  image_url: url
)
file = File.open("app/assets/images/seed/desert_scene2.png")
desert_scene2.image.attach(io: file, filename: "desert_scene2.png", content_type: "image/png")
desert_scene2.save!

puts "scenes seeded"
