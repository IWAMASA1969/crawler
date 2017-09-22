# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = "http://www.hatena.ne.jp"
html = open(url)
doc = Nokogiri::HTML(html)

puts doc.xpath('/html/head/title')
puts doc.xpath('//title')

puts doc.xpath("//ul[@id='servicelist']/li[3]")

puts doc.xpath("//h2[@class='title']")
