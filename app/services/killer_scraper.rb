require 'byebug'
require 'nokogiri'
require 'open-uri'

url = "https://killerandasweetthang.com/sex"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)
byebug
links = html_doc.search('.post_thumb.sm-col-6.md-col-4.grow').map do |element|
  element.attributes["href"].value
end

  # SCRAPE INDIVIDUAL ARTICLES
  links.each do |link|
    begin
      puts "Putting #{link} into Nokogiri"
      url = "https://www.o.school#{link}"
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      byebug
      content_all = html_doc.search('.article-rich-text.w-richtext').text
      if content_all.index("Related Articles").nil?
        content = content_all
      else
        content = content_all[0..(content_all.index("Related Articles") - 2)]
      end

      results << {
        category: html_doc.search('.current-topic').first.text.downcase,
        title: html_doc.search('.article-heading').text,
        content: content,
        img_url: html_doc.search('.object-fit---cover').first.attributes["src"].value,
        source: 'O.School'
      }
    rescue => e
      puts link
      puts e
    end
  end
