#require 'byebug'
require 'nokogiri'
require 'open-uri'

puts "Starting to scrape YT"
url = "https://www.youtube.com/channel/UCIRoo9Lsz1DOXRIvEo-UARQ/videos"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

#byebug
links = html_doc.search('.Blog-header-content-link').map do |element|
  element.attributes["href"].value
end
