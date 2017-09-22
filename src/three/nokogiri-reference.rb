# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = "https://www.yahoo.co.jp"
html = open(url)
doc = Nokogiri::HTML(html)

puts doc.at('//title').to_html
puts doc.at('//title').to_xhtml
puts doc.at('//title').to_xml
puts doc.at('//title').to_s

puts doc.at('//title').text
puts doc.at('//title').inner_html
puts doc.at('//title').inner_text
puts doc.at('//title').to_str

puts doc.at('//a').[]('href')
puts doc.at('//a').attribute('href')
puts doc.at('//a').get_attribute('href')

puts doc.xpath('//title').to_html
puts doc.xpath('//title').to_xhtml
puts doc.xpath('//title').to_xml
puts doc.xpath('//title').to_s

puts doc.xpath('//title').text
puts doc.xpath('//title').inner_html
puts doc.xpath('//title').inner_text

doc_at = doc.at('//a')
puts doc_at.class

doc_xpath = doc.xpath('//a')
puts doc_xpath.class
