require 'nokogiri'
require 'open-uri'

url = "https://www.amazon.co.jp/gp/bestsellers/"
encoding = "Shift_JIS"
#encoding = "UTF-8"
html = open(url, "r:" + encoding)
doc = Nokogiri.HTML(html, nil, encoding)

puts doc.xpath('//title').text
