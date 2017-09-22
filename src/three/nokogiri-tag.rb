# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = "https://www.yahoo.co.jp"
html = open(url)
doc = Nokogiri::HTML(html)

title_xpath = doc.xpath('/html/head/title')
title_css = doc.css('title')
objects = doc.xpath('//a')

puts title_xpath
puts title_css
puts objects
