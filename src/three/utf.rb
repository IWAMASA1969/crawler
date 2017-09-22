require 'nokogiri'
require 'open-uri'

url = "https://www.amazon.co.jp/gp/bestsellers/"
src_encoding = "Shift_JIS"
dst_encoding = "UTF-8"
ops = {:invalid => :replace, :undef => :replace, :replace => "*"}
html = open(url).read.encode(dst_encoding, src_encoding, ops)
doc = Nokogiri.HTML(html)

puts doc.xpath('//title').text
