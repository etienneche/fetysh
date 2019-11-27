puts 'Delete all articles_path'
Article.destroy_all
puts 'Done'

puts 'Create 5 categories'
  Category.create!(
    name: 'Masturbation'
  )

  Category.create!(
    name: 'Consent'
  )

  Category.create!(
    name: 'Oral'
  )

  Category.create!(
    name: 'Orgasm'
  )

  Category.create!(
    name: 'Sex Toys'
  )

puts 'Done'

puts 'Create 10 new articles'

10.times do
  Article.create!(
    title: Faker::Restaurant.name,
    content: Faker::Lorem.paragraph,
    user_id: 1,
    category_id: 1
  )
end

puts 'Done'
