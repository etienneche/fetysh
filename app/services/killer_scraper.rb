require 'byebug'
require 'nokogiri'
require 'open-uri'

# SCRAPE ARTICLES---------------------------------------------------------------
# WILDFLOWER SEX----------------------------------------------------------------

url = "https://wildflowersex.com/blogs/blog"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

links = html_doc.search('.article-content').search("a").map do |element|
  element.attributes["href"].value
end

# SCRAPE INDIVIDUAL ARTICLES
links.each do |link|
  begin
    puts "Putting #{link} into Nokogiri"
    url = "https://wildflowersex.com/#{link}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    results << {
      category: 'sex',
      title: html_doc.search('.desktop-10.mobile-3').text,
      content: html_doc.search('.rte').search("p").text,
      img_url: html_doc.search('img')[2].attributes["src"].value,
      source: 'Wildflower Sex'
    }
  rescue => e
    puts link
    puts e
  end
end
