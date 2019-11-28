puts 'Delete all articles_path'
Reaction.destroy_all
Event.destroy_all
Article.destroy_all
User.destroy_all

puts 'Done'

puts 'Create user'
User.create!(
  name:"Michael Jordan",
  password:"123456",
  email:"t@t.com"
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
    source: 'O.school',
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

puts 'Create 10 new events'

10.times do
  Event.create!(
    title: Faker::Restaurant.name,
    address: 'Berlin Alexanderplatz',
    date: Date.today,
    description: Faker::Lorem.paragraph,
    user_id: User.first.id,
    category_id: Category.first.id,
    img_url: 'https://images.unsplash.com/photo-1498842812179-c81beecf902c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'
    )
end

puts 'Done'
