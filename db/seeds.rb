puts 'Delete all articles_path'
Reaction.destroy_all
Article.destroy_all
User.destroy_all

puts 'Done'

puts 'Create user'
User.create!(
  name:"Test",
  password:"123456",
  email:"test@test.com"
)


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
    user_id: User.first.id,
    category_id: Category.first.id,
    img_url: 'https://source.unsplash.com/featured/?sex'
  )
end

puts 'Done'

puts 'Create 1 Reaction'

Reaction.create!(
  user_id: User.first.id,
  article_id: Article.first.id,
  reaction: 'love'
)
