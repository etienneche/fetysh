require 'byebug'
require 'nokogiri'
require 'open-uri'

# SCRAPER EVENTBRITE -------------------------------------------------------------
# SCRAPE LINKS TO ARTICLES
puts 'start the scraper'
results = []

locations = [
  'united-kingdom',
  'germany'
  ''
]

locations.each do |location|
  url = "https://www.eventbrite.com/d/#{location}/orgasm/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  links = html_doc.search('.aktuellePartysTeas').map do |element|
    element.search("a").attribute("href").value
  end
  byebug
  # SCRAPE INDIVIDUAL ARTICLES
  links.each do |link|
    begin
      puts "Putting #{link} into Nokogiri"
      url = "https://www.insomnia-berlin.de/#{link}"
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      byebug
      results << {
        category: html_doc.search('.content-hed.standard-hed').first.text,
        title: html_doc.search('.content-hed.standard-hed').first.text,
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
