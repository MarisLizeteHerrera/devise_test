pet_amount = 5

#Pets
pet_amount.times do
  Pet.create(
    name: Faker::Cat.name
    animal: Faker::Cat.breed
    color: Faker::Color.color_name
  )
end
puts "#{pet_amount} Pets Created..."