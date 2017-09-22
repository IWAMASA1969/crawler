# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = "https://www.yahoo.co.jp"
html = open(url)
doc = Nokogiri::HTML(html)

puts doc.class
puts doc.title
puts doc.encoding

puts doc.xpath('//title')
