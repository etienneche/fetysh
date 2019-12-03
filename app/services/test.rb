require 'byebug'
require 'nokogiri'
require 'open-uri'

# SCRAPER EVENTBRITE -------------------------------------------------------------
# SCRAPE LINKS TO ARTICLES
puts 'start the scraper'
results = []

locations = [
  'united-kingdom',
  'australia',
  'united-states'
]

locations.each do |location|
  url = "https://www.eventbrite.com/d/#{location}/orgasm/"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  links = html_doc.search('.eds-media-card-content__action-link').map do |element|
    element.attributes["href"].value
  end

  # SCRAPE INDIVIDUAL ARTICLES
  links.each do |link|
    begin
      puts "Putting #{link} into Nokogiri"
      url = "#{link}"
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      content_all = html_doc.search('.text-body-medium').text.gsub!("\n",'').gsub!("\t",'')
      results << {
        title: html_doc.search('.listing-hero-title').text,
        address: html_doc.search('.listing-map-card-street-address.text-default').text.gsub!("\n",'').gsub!("\t",''),
        organizer: html_doc.search('.js-d-scroll-to.listing-organizer-name.text-default').text.gsub!("\n",'').gsub!("\t",'').gsub!("by ",''),
        description: content_all[0..content_all.index("atUse EventbritePlan") - 1],
        photo: html_doc.search("picture").first.attributes["content"].value,
        price_cents: html_doc.search('.js-display-price').text.gsub!("\n",'').gsub!("\t",'')[1..],
        date: html_doc.search('.event-details__data').first.search("meta").first.attributes["content"].value,
        category: 'sex'
      }
    rescue => e
      puts link
      puts e
    end
  end
end
