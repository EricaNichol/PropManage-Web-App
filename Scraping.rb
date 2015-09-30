require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://vancouver.craigslist.ca/search/apa"
doc = Nokogiri::HTML(open(url))

puts doc.at_css("title").text

doc.css(".content .row").each do |item|
  description = item.at_css(".content .row .pl .a")

  puts "#{description}"

end
