# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create name: "RICE HUSK"
name0 = "RICE HUSK POWDER"
description0 = {
  material: "Rice husk 100%",
  size: "0.5 - 2 mm",
  total_moisture: "3 - 8% (m/m)",
  ash_content: "8 - 12% (m/m)",
  gross_calorific_value_on_air_dried_basic: "3.200 - 3.600 Kcal/Kg"
}
name1 = "RICE HUSK PELLETS"
description1 = {
  material: "Rice husk 100%",
  diameter: "6 - 8 mm",
  length: "0,5 - 3 cm",
  total_moisture: "3 - 10% (m/m)",
  ash_content: "8 - 12% (m/m)",
  volatile_mastter_content: "64% (m/m)",
  sulfur_content: "<0,13% (m/m)",
  fixed_carbon_content: "16,04% (MJ /Kg)",
  gross_calorific_value_on_air_dried_basic: "3.800 - 4.200 Kcal/Kg"
}

name2 = "RICE HUSK"
description2 = {
  material: "Rice husk 100%",
  total_moisture: "3 - 8% (m/m)",
  ash_content: "8 - 12% (m/m)",
  gross_calorific_value_on_air_dried_basic: "3.000 - 3.400 Kcal/Kg"

}

name3 = "RICE HUSK BRIQUETTE"
description3 = {
  material: "Rice husk 100%",
  diameter: "60 - 90 mm",
  length: "20 - 100 cm",
  total_moisture: "3 - 12% (m/m)",
  ash_content: "8 - 13% (m/m)",
  volatile_mastter_content: "64% (m/m)",
  sulfur_content: "<0,13% (m/m)",
  fixed_carbon_content: "16,04% (MJ /Kg)",
  gross_calorific_value_on_air_dried_basic: "3.800 - 4.200 Kcal/Kg"
}

name4 = "RICE HUSK GRIND"
description4 = {
  material: "Rice husk 100%",
  size: "1.8 - 2.2 mm",
  total_moisture: "<9.5% (m/m)",
  ash_content: "8 - 12% (m/m)",
  gross_calorific_value_on_air_dried_basic: "3.200 - 3.600 Kcal/Kg"
}
Product.create name: name0, description: description0, category: Category.first
Product.create name: name1, description: description1, category: Category.first
Product.create name: name2, description: description2, category: Category.first
Product.create name: name3, description: description3, category: Category.first
Product.create name: name4, description: description4, category: Category.first

image_names0= ["DETAIL RICE HUSK POWER.jpg", "RICE HUSK POWER.jpg"]
image_names1= ["RICE HUSK PELLETS.jpg",]
image_names2= ["RICE HUSK.png", "RICE HUSK2.jpg"]
image_names3= ["RICE HUSK BRIQUETTE.jpg"]
image_names4= ["RICE HUSK GRIND.jpg"]

image_names0.each do |image|
  Image.create(name: image, product: Product.limit(1).offset(0)[0])
end

image_names1.each do |image|
  Image.create(name: image, product: Product.limit(1).offset(1)[0])
end

image_names2.each do |image|
  Image.create(name: image, product: Product.limit(1).offset(2)[0])
end
image_names3.each do |image|
  Image.create(name: image, product: Product.limit(1).offset(3)[0])
end

image_names4.each do |image|
  Image.create(name: image, product: Product.limit(1).offset(4)[0])
end
