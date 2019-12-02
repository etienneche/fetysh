require 'byebug'
require 'nokogiri'
require 'open-uri'

# SCRAPER EVENTBRITE -------------------------------------------------------------
# SCRAPE LINKS TO ARTICLES
puts 'start the scraper'
results = []

url = "https://www.insomnia-berlin.de/partys.html"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
byebug
links = html_doc.search('.aktuellePartysTeas').map do |element|
  element.attributes["href"].value
end

  # SCRAPE INDIVIDUAL ARTICLES
  links.each do |link|
    begin
      puts "Putting #{link} into Nokogiri"
      url = "https://www.cosmopolitan.com/#{link}"
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
