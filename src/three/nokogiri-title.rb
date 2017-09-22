# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = "https://www.yahoo.co.jp"
html = open(url)
doc = Nokogiri::HTML(html)

nodesets = doc.xpath('//title')

puts nodesets.text
puts nodesets.inner_text
puts nodesets.first.inner_text

nodesets.each{|nodeset|
  puts nodeset.content()
  puts nodeset.text
  puts nodeset.inner_text
}
