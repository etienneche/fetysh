# puts 'Delete everything'
# Reaction.destroy_all
# Review.destroy_all
# Rating.destroy_all
Order.destroy_all
Event.destroy_all
# Article.destroy_all
# Category.destroy_all
# User.destroy_all

puts 'Done'

# # # CREATE USERS ---------------------------------------------------------------
# puts 'Create user'
# User.create!(
#   name: 'Scraper',
#   password: '123456',
#   email: 'a@a.com'
#   )

# puts 'Create presented user'
# User.create!(
#   name: 'Becky Willington',
#   password: '123456',
#   email: 't@t.com',
#   photo: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'
#   )

# puts 'Done'

# Category.create!(
#   name: 'sex'
# )

# # CREATE ARTICLES --------------------------------------------------------------

# # # TABU ---------------------------------------------------------------
# puts "Starting to scrape tabu"
# url = "https://talktabu.com/zine"
# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# links = html_doc.search('.Blog-header-content-link').map do |element|
#   element.attributes["href"].value
# end

# # SCRAPE INDIVIDUAL ARTICLES
# results = []
# links.each do |link|
#   begin
#     puts "Parsing #{link} into nokogiri"
#     url = "https://talktabu.com#{link}"
#     html_file = open(url).read
#     html_doc = Nokogiri::HTML(html_file)
#     content_all = html_doc.search('.sqs-block.html-block.sqs-block-html').text
#     if content_all.index("Header image").nil?
#       if !content_all.index("Sources:http").nil?
#         content = content_all[0..content_all.index("Sources:http") - 1]
#       end
#     else
#       content = content_all[0..content_all.index("Header image") - 1]
#     end
#     results << {
#       category: html_doc.search('.Blog-meta-item-category').first.text.downcase,
#       author: html_doc.search('.Blog-meta-item.Blog-meta-item--author').first.text,
#       title: html_doc.search('.Blog-title.Blog-title--item').text,
#       content: content,
#       photo: html_doc.search('img')[2].attributes["data-src"].value,
#       source: 'tabú'
#     }
#   rescue => e
#     puts link
#     puts e
#   end
# end

# # CREATE CATEGORIES FROM SCRAPE
# puts 'Creating categories from Tabu Scrape'
# results.each do |result|
#   if Category.find_by(name: result[:category]).nil?
#     Category.create!(
#       name: result[:category]
#       )
#   end
# end
# puts 'Categories done'

# # CREATE ARTICLES FROM SCRAPE
# puts 'Creating articles from tabu scrape'
# results.each do |result|
#   if !result[:content].nil?
#     Article.create!(
#       title: result[:title],
#       content: result[:content],
#       author: result[:author],
#       user_id: User.find_by(name: 'Scraper').id,
#       source: result[:source],
#       category_id: Category.find_by(name: result[:category]).id,
#       photo: result[:photo]
#       )
#   end
# end
# puts "Done"

# puts 'Scraping Tabu is done'

# # # SCRAPER O.SCHOOL------------------------------------------------------------
# puts 'Start the O.School Scraper'
# topics = [
#   'anal-sex',
#   'culture',
#   'first-time-sex',
#   'orgasm',
#   'sex-toys',
#   'communication',
#   'dating-and-relationships',
#   'kinky',
#   'penis',
#   'consent',
#   'eating-pussy',
#   'masturbation',
#   'porn',
#   'vagina-vulva'
# ]

# results = []
# topics.each do |topic|
#   puts "Search for topic #{topic.upcase}"
#   url = "https://www.o.school/topic/#{topic}"
#   html_file = open(url).read
#   html_doc = Nokogiri::HTML(html_file)
#   links = html_doc.search('.topic-card.inside.w-inline-block').map do |element|
#     element.attributes["href"].value
#   end

#   # SCRAPE INDIVIDUAL ARTICLES
#   links.each do |link|
#     begin
#       puts "Putting #{link} into Nokogiri"
#       url = "https://www.o.school#{link}"
#       html_file = open(url).read
#       html_doc = Nokogiri::HTML(html_file)
#       content_all = html_doc.search('.article-rich-text.w-richtext').text
#       if content_all.index("Related Articles").nil?
#         content = content_all
#       else
#         content = content_all[0..(content_all.index("Related Articles") - 2)]
#       end

#       results << {
#         category: html_doc.search('.current-topic').first.text.downcase,
#         title: html_doc.search('.article-heading').text,
#         content: content,
#         photo: html_doc.search('.object-fit---cover').first.attributes["src"].value,
#         source: 'O.School'
#       }
#     rescue => e
#       puts link
#       puts e
#     end
#   end
# end

# # CREATE CATEGORIES FROM SCRAPE
# puts 'Creating categories from O.school Scrape'
# results.each do |result|
#   if Category.find_by(name: result[:category]).nil?
#     Category.create!(
#       name: result[:category]
#       )
#   end
# end

# puts 'Creating articles from o.school scrape'
# results.each do |result|
#   Article.create!(
#     title: result[:title],
#     content: result[:content],
#     user_id: User.find_by(name: 'Scraper').id,
#     source: result[:source],
#     category_id: Category.find_by(name: result[:category]).id,
#     photo: result[:photo]
#     )
# end
# puts 'Scraping O.School is done'

# #-------------------------------------------------------------------------------
# # WILDFLOWER SEX----------------------------------------------------------------
# #-------------------------------------------------------------------------------
# puts 'Start to scrape WILDFLOWER sex'

# results = []
# url = "https://wildflowersex.com/blogs/blog"
# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)

# links = html_doc.search('.article-content').search("a").map do |element|
#   element.attributes["href"].value
# end

# # SCRAPE INDIVIDUAL ARTICLES
# links.each do |link|
#   begin
#     puts "Putting #{link} into Nokogiri"
#     url = "https://wildflowersex.com/#{link}"
#     html_file = open(url).read
#     html_doc = Nokogiri::HTML(html_file)
#     results << {
#       category: 'sex',
#       title: html_doc.search('.desktop-10.mobile-3').text,
#       content: html_doc.search('.rte').search("p").text,
#       photo: html_doc.search('img')[2].attributes["src"].value,
#       source: 'Wildflower Sex'
#     }
#   rescue => e
#     puts link
#     puts e
#   end
# end

# puts 'Creating articles from wildflower scrape'
# results.each do |result|
#   Article.create!(
#     title: result[:title],
#     content: result[:content],
#     user_id: User.find_by(name: 'Scraper').id,
#     source: result[:source],
#     category_id: Category.find_by(name: result[:category]).id,
#     photo: result[:photo]
#     )
#   puts "Created article: #{result[:title]}"
# end
# puts 'Scraping Wildflower is done'

# puts 'Done'

# ------------------- EVENTS SEED ----------------------------------------------
puts 'Create real events'

Event.create!(
  title: "Porn Union by Pornceptual",
  address: 'Lx Factory, Lisbon',
  date: DateTime.parse("06/08/2020 20:00"),
  description: "In the spirit of recent political events, we invite you to celebrate unity and all that brings us together.
  With the rise of far-right groups in the European Parliament, fighting to stop the legitimization of hate-fueled narratives is now more than ever necessary.
  For the next edition of Pornceptual, we will use porn to expose and challenge anti-democratic ideologies and their continued existence. Naked bodies have no frontiers.
  Our political awareness efforts aren’t about praising EU as an institution, but to honor the idea of a united continent. We will move forward to propose a new form of UNION that will create a global identity, in opposition to nationalism and borders.
  At PORN UNION, you’ll be part of a symbolic fight against everything that separates us. We believe in the exploration of one’s uniqueness and giving an opportunity to feel what unification has to offer.
  We encourage you to present your differences and experience others shamelessly. Find the same kinks and discover new ones. Come, open your borders and show that we are stronger than ever!",
  user_id: User.find_by(name: "Scraper").id,
  organizer: "Pornceptual",
  category_id: Category.find_by(name: "sex").id,
  photo: 'https://images.unsplash.com/photo-1517263904808-5dc91e3e7044?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "1st Sex-positive Ball",
  address: 'Mosteiro dos Jeronimos, Lisbon',
  date: DateTime.parse("30/01/2020 20:00"),
  description: "The European Sex-positive Community launches its first sex-positive Ball this November at the Insomnia Berlin!
  This is more than just an evening but a whole weekend dedicated to sex-positivity with talks, workshops, a kinky auction and, as grand finale, the costume ball !!
  And we are all about party-cipation! The event is a fundraiser for the s+ community europe project (more infos sex-positive.com).",
  user_id: User.find_by(name: "Scraper").id,
  organizer: "Insomnia Lisbon",
  category_id: Category.find_by(name: "sex").id,
  photo: 'https://www.insomnia-berlin.de/galpics/galleries/eventflyer/large/0000057588.jpg',
  price: rand(40..200)
  )

Event.create!(
  title: 'Orgies De Luxe',
  address: 'Alges, Portugal',
  date: DateTime.parse('12/12/2019'),
  description: "A sexparty where not only nymphomaniac women are fulfilling their wildest fantasies, but are also joined by a lot of couples in the horny game with the herd effect.
  Orgies - lecherous ladies - spicy fantasies - experimenting couples - Cuckold - Wifesharing
  The naughty Thursday at INSOMNIA! We start up early in the afternoon when the men-craving ladies from the Club of nymphomaniacs pursue their insatiable instincts and preferably get satisfied by a pack of men.
  Later in the evening they are joined by adventurous couples, who experiment with all sorts of fantasies.
  One may give away his wife blindfolded, the next wants a group insemination, the active lady showing off her cuckold, etc.
  A hot idea being used by a horny couple for their dirty fantasy ... isn't it?",
  user_id: User.find_by(name: "Scraper").id,
  organizer: 'Insomnia Berlin',
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://www.insomnia-berlin.de/galpics/galleries/eventflyer/large/0000042860.jpg',
  price: rand(40..200)
  )

Event.create!(
  title: "Tantra Massage Training",
  address: 'Odivelas, Portugal',
  date: DateTime.parse("30/03/2020"),
  description: "During the Tantra Massage training you learn how to express respect and appreciation towards a person as a sexual being. For this you need to be willing to question your own behavioural patterns. We will discuss in great detail what Tantra means and how we can bring to life the tantric teachings in a massage. You will learn about the study of auras. With intensive exercises we increase our physical awareness.",
  user_id: User.find_by(name: "Scraper").id,
  organizer: 'Kashima Lisbon',
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1545183322-6da710083410?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Wednesday's Wildest Fetish presents: The Squirtinator",
  address: 'Museu do Oriente, Lisbon',
  date: DateTime.parse("09/12/2019"),
  description: "Fetish Orgy - Slavegirls Demonstration & Condemnation - Bizarresex - BDSM Playparty in the Catacombs in the Basement
  Also for Swingers, Wifesharers & Cuckoldfriends who want to extend their sexual horizons. Welcome to the Insomnia Sex Lab!
  The Squirtinator shows the ladies and their partners where the G spot lies and which sparkling pleasures one can trigger with it.
  Our club of the nymphomaniacs is always haunted by such desires, which is why the most naughty of the ladies are especially looking forward to this date. They are craving for squirty games.",
  user_id: User.find_by(name: "Scraper").id,
  organizer: 'Insomnia Lisbon',
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://www.insomnia-berlin.de/galpics/galleries/eventflyer/large/0000054573.jpg',
  price: rand(40..200)
  )

Event.create!(
  title: "Sex-Ed For Grown Ups",
  address: 'Parque Eduardo VII, Lisbon',
  date: DateTime.parse("30/01/2020"),
  description: "Join us for an evening exploring what the future of sex education could be, how our own sex-ed shaped our view of sex, and what questions were we left with.
  We’ll have a look at the anatomy lesson we probably didn’t get at school, and why the textbooks we had weren’t great, with Alakina Mann of Anatomyofpleasure.org.
  Hear from Kitty May, Director of Education at ‘Other Nature,’ an inclusive sex shop in Berlin, about the ‘sex-ed for grown-ups’ workshops they offer, such as ‘Demystifying orgasm,’ as well as some of the common questions she gets in this unique line of work. Kitty is also a practicing counsellor with a special focus on sexuality.",
  organizer: "Sex for everyone LTDA",
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "sex").id,
  photo: 'https://images.unsplash.com/photo-1498843053639-170ff2122f35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Orgasmic Flowing - Sacred Tantra Workshop",
  address: 'Museu Nacional de Arte Antiga, Lisbon',
  date: DateTime.parse("18/12/2019"),
  description: "How much do you embrace your ORGASMIC being?
  How much are you breathing in LIFE and BLISS into all your cells? Do you reall say YES to your joy?
  Do you allow yourself to vibrate from PLEASURE?
  This evening is about feeling myself, freeing my orgasmic being, breathing into my soul, honouring my YES and embodying divine pleasure ~ coming home to the blissful and orgasmic being that we are!
  We will share a unique and specific orgasmic meditation with you that is also part of the Mastery Retreat Free your Soul!
  There is no nudity or sexual activities in this Tantra workshop. The workshop is suitable for singles, couples, multi orgasmic beings and for people that have never experienced any orgasm.",
  organizer: 'Diamond Lotus',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "wellness").id,
  photo: 'https://scontent.flis8-2.fna.fbcdn.net/v/t31.0-8/14362665_639659282875092_7117318554322478844_o.jpg?_nc_cat=100&_nc_ohc=uGYNN07uDZcAQk0_EJGrOMcqJTrXDcM2VO7sxEA5vzboMkHGysM5GURtg&_nc_ht=scontent.flis8-2.fna&oh=375b3ca497287c69fdafb4c4b01adde4&oe=5E427DE6',
  price: rand(40..200)
  )


Event.create!(
  title: "Pompoir Workshop",
  address: 'Estadio da Luz, Lisbon',
  date: DateTime.parse("17/12/2019"),
  description: " The ancient skill of the vaginal muscles management respected throughout the ages and was integrated into cultures for its betterment for women in a great many traditions.
  Techniques, which mostly came from Tantra, Tao and Kama Sutra heritage and known in Europe as Pompoir, in South Asia as Kabazah, in Hinduism as Sahajoli, in Russia as Vumbuilding (from abbreviation “ВУМ” (“вагинальные управляемые мышцы” – “vaginal controllable muscles”) become increasingly more popular in modern culture.
  Nowadays, many specialists (sexologists, gynecologists, psychologists) recommend these methods and successfully use it in the sexual healing",
  organizer: 'Mystic Techniques',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1569979274099-f351a7ea19a3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Love Dance Workshop",
  address: 'Cascais, Portugal',
  date: DateTime.parse("22/12/2019"),
  description: "Tantra Yoga considers the universe as a consequence of the divine fusion, the sacred dance of the loving couple of Shiva and Shakti.
  These are the two halves of the single whole, the fusion, and harmony of the male and female energies that give birth to Life. It is the divine creative power in the Universe, perfect unity, supreme bliss.
  The highest experience of the divine couple is merging their energies thus cease to be separate and become one.
  For loving couples, we offer a myriad of powerful of Tantric and Taoist techniques for understanding this sacred unity for all its admiration and joy..",
  organizer: 'Mystic Techniques',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1555489401-79c274997434?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Yoni Massage",
  address: 'Cascais, Portugal',
  date: DateTime.parse("15/01/2020"),
  description: "In sexual healing Sanskrit word yoni symbolizes the female genitalia: both the uterus and the vulva.
  Ancient teachings such as Tantra and Tao believe that a lot of trauma, negative emotions related to relationship, and sexuality are stored in the yoni in the form of energy blocks manifesting in pain and numbness, lack of sensitivity and inability to climax.
  Learn healing techniques (sometimes called yoni massage) to bring awareness to energetic blocks and transmute them. Find out how to revive sensuality, increase pleasure and frequency and strength of orgasms, bring your relationship on a whole different level",
  organizer: 'Mystic Techniques',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "wellness").id,
  photo: 'https://images.unsplash.com/photo-1545183322-6da710083410?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Female Orgasms",
  address: 'Praia de Carcavelos, Portugal',
  date: DateTime.parse("22/12/2029"),
  description: "Would you like to experience more than 24 types of orgasms? Maybe you don't experience any orgasm at all? Are you cumming only from a vibrator? Do you have to fake your orgasm to please your partner?
  Your orgasms are not as frequent as you would like? Do you want your orgasms to be more powerful? Do you want to cum at the same time as your partner? Do you only cum from masturbation? Do you want to experience multiple orgasms?
  Do you want to know the beauty of female ejaculation? If you answered “yes” to one or more of these questions, then this workshop is for you.",
  organizer: 'Mystic Techniques',
  user_id: User.find_by(name: "Scraper").id,
  photo: 'https://mystictechniques.com/wp-content/uploads/2019/10/CYEKY3gWcAEk9Fh.jpg',
  category_id: Category.find_by(name: "pleasure").id,
  price: rand(40..200)
  )

Event.create!(
  title: "Naked Ping-Pong Tournament",
  address: 'Lisbon',
  date: DateTime.parse("13/12/2019"),
  description: "Do you like ping pong? Join us in the first international Naked Ping Pong Tournament in Lisbon.
  An amazing opportunity to play hard.",
  organizer: 'Le Wagon Lisbon',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1564518440696-ef272968778e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "ByeBug Orgy Party",
  address: 'Lisbon',
  date: DateTime.parse("06/12/2019"),
  description: "Are you looking for a group of fun and new exciting experience? You are welcome to join our group and experience the wild and unforgettable party.
  Come rake with us! Please note that computers are not allowed!",
  organizer: 'Le Wagon Lisbon',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1545128485-c400e7702796?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Naked Karaoke",
  address: 'Lisbon',
  date: DateTime.parse("07/12/2019"),
  description: "We are a group of enthusiastic´s singers who like to sing naked to be more comfortable.
  Come meet us and show your talents.",
  organizer: 'Le Wagon Lisbon',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1534774251706-35764d143b56?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "#SEXTALK",
  address: 'Lisbon',
  date: DateTime.parse("06/12/2019"),
  description: "We are a group of enthusiastic´s singers who like to sing naked to be more comfortable.
  Come meet us and show your talents.",
  organizer: 'Le Wagon Lisbon',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1526509569184-2fe126e71cd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Carnival - All inclusive ",
  address: 'MAAT, Lisbon',
  date: DateTime.parse("12/02/2020"),
  description: "Are you ready for the best days of your life?
  The only Carnival in the world with Alcohol, drugs and sex included.",
  organizer: 'Le Wagon',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1573676047757-905630d8e3ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
  price: rand(40..200)
  )

Event.create!(
  title: "Sex Animal - Workshop ",
  address: 'Jardim Zoologico de Lisboa',
  date: DateTime.parse("20/12/2019"),
  description: "The animals, there are some interesting animals. Just imagine how elephant sex is, and the kitties that pass by leave a shit trail.
  Enjoy us to learn more about animal biology.",
  organizer: 'Le Wagon Torres Vedras',
  user_id: User.find_by(name: "Scraper").id,
  category_id: Category.find_by(name: "pleasure").id,
  photo: 'https://images.unsplash.com/photo-1524706088418-1b1ce0a23b20?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1488&q=80',
  price: rand(40..200)
  )


puts 'Done'
