# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = "https://www.amazon.co.jp/gp/rss/bestsellers/books/466282/ref=zg_bs_466282_rsslink"
xml = open(url).read
doc = Nokogiri::XML(xml)

items = doc.xpath('//rss/channel/item')
items.each { |item|
  puts item.xpath('title').text
}
