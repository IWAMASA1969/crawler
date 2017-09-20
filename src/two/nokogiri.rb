require 'nokogiri'
require 'open-uri'

url = "http://nokogiri.org/"
doc = Nokogiri.HTML(open(url))

doc.css('a').each do |element|
  puts element[:href]
end
