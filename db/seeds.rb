puts 'Delete all articles_path'
Article.destroy_all
puts 'Done'

puts "Create 10 new articles"

10.times do
  Article.create!(
    title: Faker::Restaurant.name,
    content: )
end
