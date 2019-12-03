require 'byebug'
require 'nokogiri'
require 'open-uri'


      url = 'https://www.o.school/article/ass-licking'
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      byebug
      results << {
        category: html_doc.search('.current-topic').first.text.downcase,
        title: html_doc.search('.article-heading').text,
        content: html_doc.search('.article-rich-text.w-richtext').text,
        img_url: html_doc.search('.object-fit---cover').first.attributes["src"].value,
        source: 'O.School'
      }

