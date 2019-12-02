require 'byebug'
require 'nokogiri'
require 'open-uri'

# SCRAPER O.SCHOOL -------------------------------------------------------------
# SCRAPE LINKS TO ARTICLES
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

topics.each do |topic|
  puts "Search for topic #{topic.upcase}"
  url = "https://www.o.school/topic/#{topic}"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  links = html_doc.search('.topic-card.inside.w-inline-block').map do |element|
    element.attributes["href"].value
  end

  # SCRAPE INDIVIDUAL ARTICLES
  results = []
  links.each do |link|
    begin
    puts "Putting #{link} into Nokogiri"
    url = "https://www.o.school#{link}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    results << {
      category: html_doc.search('.current-topic').first.text,
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
