require 'nokogiri'
require 'open-uri'

url = "https://www.amazon.co.jp/gp/rss/bestsellers/digital-text/2291905051/"
xml = Nokogiri::XML(open(url).read)

puts xml.xpath('/rss/channel/title').text

item_nodes = xml.xpath('//item')
item_nodes.each do |item|
  puts item.xpath('title').text
  puts item.xpath('link').text.match(%r{dp/(.+?)/})[1]
end
