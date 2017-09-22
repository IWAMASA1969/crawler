# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = "https://www.yahoo.co.jp"
html = open(url)
doc = Nokogiri::HTML(html)

nodesets = doc.xpath('//a')
puts nodesets.inner_text

nodesets.each{|node|
  puts node.inner_text
}
