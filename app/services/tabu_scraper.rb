require 'byebug'
require 'nokogiri'
require 'open-uri'

puts "Starting to scrape tabu"
url = "https://talktabu.com/zine"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

links = html_doc.search('.Blog-header-content-link').map do |element|
  element.attributes["href"].value
end

# SCRAPE INDIVIDUAL ARTICLES
results = []
links = ['/zine/period-savings']
links.each do |link|
  begin
    puts "Parsing #{link} into nokogiri"
    url = "https://talktabu.com#{link}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    byebug
    content_all = html_doc.search('.sqs-block.html-block.sqs-block-html').text
    if content_all.index("Header image").nil?
      if !content_all.index("Sources:http").nil?
        content = content_all[0..content_all.index("Sources:http") - 1]
      end
    else
      content = content_all[0..content_all.index("Header image") - 1]
    end

    results << {
      category: html_doc.search('.Blog-meta-item-category').first.text.downcase,
      author: html_doc.search('.Blog-meta-item.Blog-meta-item--author').first.text,
      title: html_doc.search('.Blog-title.Blog-title--item').text,
      content: content,
      img_url: html_doc.search('img')[2].attributes["data-src"].value,
      source: 'tabú'
    }
  rescue => e
    puts link
    puts e
  end
end
