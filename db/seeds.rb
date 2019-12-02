puts 'Delete everything'
Reaction.destroy_all
Review.destroy_all
Rating.destroy_all
Order.destroy_all
Event.destroy_all
Article.destroy_all
User.destroy_all
Category.destroy_all

puts 'Done'

# CREATE USERS -----------------------------------------------------------------
puts 'Create user'
User.create!(
  name: 'Scraper',
  password: '123456',
  email: 't@t.com'
  )

User.create!(
  name: 'Kashima Berlin',
  password: '123456',
  email: 'c@d.com',
  photo: 'https://www.kashima.de/fileadmin/template/images/logo.png'
  )

User.create!(
  name: 'Pornceptual',
  password: '123456',
  email: 'a@a.com',
  photo: 'https://www.residentadvisor.net/images/promoter/de-pornceptual.jpg',
  description: 'Pornceptual presents pornography as queer, diverse and inclusive. We aim to prove that pornography can be respectful, intimate and artistic, while questioning usual pornographic labels. “Can art succeed where porn fails – to actually turn us on?”'
  )

User.create!(
  name: 'Insomnia Berlin',
  password: '123456',
  email: 'b@b.com',
  photo: 'https://www.insomnia-berlin.de/galpics/galleries/eventflyer/large/0000057589.jpg',
  description: 'INSOMNIA is a club in which cosmopolitan freaks, urban night birds, polymorphic party people, creatives and travellers from all over the world celebrate together to the pulsating beat of the night.
  INSOMNIA is much more than just a mixture of party, fetish and swinging clubs - it is a hedonistic parallel universe with parties that are sex-positive, full of casual intimacy and sensuality for all forms of love or relationships: whether vanilla, swinger, gender fluid, bizarre, fetish or BDSM.
  INSOMNIA is a temple where you can experiment with non-traditional relationship structures, sexual experiences, self-exploration, and polysexuality. We offer a clean, safe sexual escapade infrastructure that is sexpositive & bodypositive, openminded, heteroflexible & clandestine - Newcomers are very welcome!
  Get into your most eager role, your naughtiest costume, your breath-taking lingerie, your most daring outfits or your stylish fetish robe and make INSOMNIA what it is - with your intoxicating aura, your dazzling flair and your grandezza!
  Be libidinous!'
  )

User.create!(
  name: 'Factory Berlin',
  password: '123456',
  email: 'c@c.com',
  photo: 'https://dr0wv9n0kx6h5.cloudfront.net/2754b559c5e6a1fd71093232df57dcf70462c5e7/content/03-blog/80-factory-berlin-a-new-place-for-us-to-call-home/01@2x.jpg'
  )

puts 'Done'

# CREATE CATEGORIES FOR EVENTS
Category.create!(
  name: 'Fetish')

Category.create!(
  name: 'Sex Positive')

Category.create!(
  name: 'Tantra')

Category.create!(
  name: 'Sex Ed')

# CREATE ARTICLES --------------------------------------------------------------

# SCRAPER TABU -----------------------------------------------------------------
# SCRAPE LINKS TO ARTICLES
puts "Starting to scrape tabu"
url = "https://talktabu.com/zine"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

links = html_doc.search('.Blog-header-content-link').map do |element|
  element.attributes["href"].value
end

# SCRAPE INDIVIDUAL ARTICLES
results = []
links.each do |link|
  begin
    puts "Parsing #{link} into nokogiri"
    url = "https://talktabu.com#{link}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    content_all = html_doc.search('.sqs-block.html-block.sqs-block-html').text
    results << {
      category: html_doc.search('.Blog-meta-item-category').first.text.downcase,
      author: html_doc.search('.Blog-meta-item.Blog-meta-item--author').first.text,
      title: html_doc.search('.Blog-title.Blog-title--item').text,
      content: content_all[0..content_all.index("Header image") - 1],
      img_url: html_doc.search('img')[2].attributes["data-src"].value,
      source: 'tabú'
    }
  rescue => e
    puts link
    puts e
  end
end

# CREATE CATEGORIES FROM SCRAPE
puts 'Creating categories from Tabu Scrape'
results.each do |result|
  if Category.find_by(name: result[:category]).nil?
    Category.create!(
      name: result[:category]
      )
  end
end
puts "Done"

# CREATE ARTICLES FROM SCRAPE
puts 'Creating articles from tabu scrape'
results.each do |result|
  Article.create!(
    title: result[:title],
    content: result[:content],
    author: result[:author],
    user_id: User.find_by(name: 'Scraper').id,
    source: result[:source],
    category_id: Category.find_by(name: result[:category]).id,
    img_url: result[:img_url]
    )
end
puts "Done"

puts 'Scraping Tabu is done'

# SCRAPER O.SCHOOL------------------------------------------------------------
# SCRAPE LINKS TO ARTICLES
puts 'Start the O.School Scraper'
topics = [
  'anal-sex',
  'culture',
  'first-time-sex',
  'orgasm',
  'sex-toys',
  'communication',
  'dating-and-relationships',
  'kinky',
  'penis',
  'consent',
  'eating-pussy',
  'masturbation',
  'porn',
  'vagina-vulva'
]

results = []
topics.each do |topic|
  puts "Search for topic #{topic.upcase}"
  url = "https://www.o.school/topic/#{topic}"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  links = html_doc.search('.topic-card.inside.w-inline-block').map do |element|
    element.attributes["href"].value
  end

  # SCRAPE INDIVIDUAL ARTICLES
  links.each do |link|
    begin
      puts "Putting #{link} into Nokogiri"
      url = "https://www.o.school#{link}"
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      results << {
        category: html_doc.search('.current-topic').first.text.downcase,
        title: html_doc.search('.article-heading').text,
        content: html_doc.search('.article-rich-text.w-richtext').text,
        img_url: html_doc.search('.object-fit---cover').first.attributes["src"].value,
        source: 'O.School'
      }
    rescue => e
      puts link
      puts e
    end
  end
end

# CREATE CATEGORIES FROM SCRAPE
puts 'Creating categories from O.school Scrape'
results.each do |result|
  if Category.find_by(name: result[:category]).nil?
    Category.create!(
      name: result[:category]
      )
  end
end

puts 'Creating articles from o.school scrape'
results.each do |result|
  Article.create!(
    title: result[:title],
    content: result[:content],
    user_id: User.find_by(name: 'Scraper').id,
    source: result[:source],
    category_id: Category.find_by(name: result[:category]).id,
    img_url: result[:img_url]
    )
end
puts 'Scraping O.School is done'

puts 'Create 1 Reaction'

Reaction.create!(
  user_id: User.first.id,
  article_id: Article.first.id,
  reaction: 'love'
  )

# ------------------- EVENTS SEED ----------------------------------------------
puts 'Create 5 real events'

Event.create!(
  title: "PORN UNION by Pornceptual",
  address: 'Alte Münze Berlin',
  date: DateTime.parse("06/08/2020 20:00"),
  description: "In the spirit of recent political events, we invite you to celebrate unity and all that brings us together. With the rise of far-right groups in the European Parliament, fighting to stop the legitimization of hate-fueled narratives is now more than ever necessary. For the next edition of Pornceptual, we will use porn to expose and challenge anti-democratic ideologies and their continued existence. Naked bodies have no frontiers.
  Our political awareness efforts aren’t about praising EU as an institution, but to honor the idea of a united continent. We will move forward to propose a new form of UNION that will create a global identity, in opposition to nationalism and borders. At PORN UNION, you’ll be part of a symbolic fight against everything that separates us. We believe in the exploration of one’s uniqueness and giving an opportunity to feel what unification has to offer. We encourage you to present your differences and experience others shamelessly. Find the same kinks and discover new ones. Come, open your borders and show that we are stronger than ever!",
  user_id: User.find_by(name: "Pornceptual").id,
  category_id: Category.find_by(name: "Sex Positive").id,
  photo: 'https://images.unsplash.com/photo-1517263904808-5dc91e3e7044?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "1st Sex-positive Ball",
  address: 'Insomnia Berlin',
  date: DateTime.parse("30/11/2019 20:00"),
  description: "The European Sex-positive Community launches its first sex-positive Ball this November at the Insomnia Berlin!
  This is more than just an evening but a whole weekend dedicated to sex-positivity with talks, workshops, a kinky auction and, as grand finale, the costume ball !!
  And we are all about party-cipation! The event is a fundraiser for the s+ community europe project (more infos sex-positive.com).",
  user_id: User.find_by(name: "Insomnia Berlin").id,
  category_id: Category.find_by(name: "Sex Positive").id,
  photo: 'https://www.insomnia-berlin.de/galpics/galleries/eventflyer/large/0000057588.jpg',
  price: rand(40..200)
  )

Event.create!(
  title: 'Orgies De Luxe',
  address: 'Insomnia Berlin',
  date: DateTime.parse('05/12/2019 20:00'),
  description: "A sexparty where not only nymphomaniac women are fulfilling their wildest fantasies, but are also joined by a lot of couples in the horny game with the herd effect.
  Orgies - lecherous ladies - spicy fantasies - experimenting couples - Cuckold - Wifesharing
  The naughty Thursday at INSOMNIA! We start up early in the afternoon when the men-craving ladies from the Club of nymphomaniacs pursue their insatiable instincts and preferably get satisfied by a pack of men.
  Later in the evening they are joined by adventurous couples, who experiment with all sorts of fantasies. One may give away his wife blindfolded, the next wants a group insemination, the active lady showing off her cuckold, etc.
  A hot idea being used by a horny couple for their dirty fantasy ... isn't it?",
  user_id: User.find_by(name: "Insomnia Berlin").id,
  category_id: Category.find_by(name: "Fetish").id,
  photo: 'https://www.insomnia-berlin.de/galpics/galleries/eventflyer/large/0000042860.jpg',
  price: rand(40..200)
  )

Event.create!(
  title: "Tantra Massage Training",
  address: 'Kashima Berlin',
  date: DateTime.parse("30/03/2020 10:00"),
  description: "During the Tantra Massage training you learn how to express respect and appreciation towards a person as a sexual being. For this you need to be willing to question your own behavioural patterns. We will discuss in great detail what Tantra means and how we can bring to life the tantric teachings in a massage. You will learn about the study of auras. With intensive exercises we increase our physical awareness.",
  user_id: User.first.id,
  category_id: Category.find_by(name: "Tantra").id,
  photo: 'https://images.unsplash.com/photo-1545183322-6da710083410?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Wednesday's Wildest Fetish presents: The Squirtinator",
  address: 'Insomnia Berlin',
  date: DateTime.parse("09/12/2019 18:00"),
  description: "Fetish Orgy - Slavegirls Demonstration & Condemnation - Bizarresex - BDSM Playparty in the Catacombs in the Basement
  Also for Swingers, Wifesharers & Cuckoldfriends who want to extend their sexual horizons. Welcome to the Insomnia Sex Lab!
  The Squirtinator shows the ladies and their partners where the G spot lies and which sparkling pleasures one can trigger with it.
  Our club of the nymphomaniacs is always haunted by such desires, which is why the most naughty of the ladies are especially looking forward to this date. They are craving for squirty games.",
  user_id: User.find_by(name: "Insomnia Berlin").id,
  category_id: Category.find_by(name: "Fetish").id,
  photo: 'https://www.insomnia-berlin.de/galpics/galleries/eventflyer/large/0000054573.jpg',
  price: rand(40..200)
  )

Event.create!(
  title: "Sex-Ed For Grown Ups",
  address: 'Factory Görlitzer Park',
  date: DateTime.parse("30/01/2020 18:00"),
  description: "Join us for an evening exploring what the future of sex education could be, how our own sex-ed shaped our view of sex, and what questions were we left with.
  We’ll have a look at the anatomy lesson we probably didn’t get at school, and why the textbooks we had weren’t great, with Alakina Mann of Anatomyofpleasure.org.
  Hear from Kitty May, Director of Education at ‘Other Nature,’ an inclusive sex shop in Berlin, about the ‘sex-ed for grown-ups’ workshops they offer, such as ‘Demystifying orgasm,’ as well as some of the common questions she gets in this unique line of work. Kitty is also a practicing counsellor with a special focus on sexuality.",
  user_id: User.find_by(name: "Factory Berlin").id,
  category_id: Category.find_by(name: "Sex Ed").id,
  photo: 'https://images.unsplash.com/photo-1498843053639-170ff2122f35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Orgasmic Flowing - Sacred Tantra Workshop Berlin",
  address: 'Diamond Lotus Berlin',
  date: DateTime.parse("30/01/2020 18:00"),
  description: "How much do you embrace your ORGASMIC being?
  How much are you breathing in LIFE and BLISS into all your cells? Do you reall say YES to your joy?
  Do you allow yourself to vibrate from PLEASURE?
  This evening is about feeling myself, freeing my orgasmic being, breathing into my soul, honouring my YES and embodying divine pleasure ~ coming home to the blissful and orgasmic being that we are!
  We will share a unique and specific orgasmic meditation with you that is also part of the Mastery Retreat Free your Soul!
  There is no nudity or sexual activities in this Tantra workshop. The workshop is suitable for singles, couples, multi orgasmic beings and for people that have never experienced any orgasm.",
  user_id: User.first.id,
  category_id: Category.find_by(name: "Tantra").id,
  photo: 'https://scontent.flis8-2.fna.fbcdn.net/v/t31.0-8/14362665_639659282875092_7117318554322478844_o.jpg?_nc_cat=100&_nc_ohc=uGYNN07uDZcAQk0_EJGrOMcqJTrXDcM2VO7sxEA5vzboMkHGysM5GURtg&_nc_ht=scontent.flis8-2.fna&oh=375b3ca497287c69fdafb4c4b01adde4&oe=5E427DE6',
  price: rand(40..200)
  )

puts 'Done'
