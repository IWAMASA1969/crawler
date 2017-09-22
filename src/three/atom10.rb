# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

url = "http://b.hatena.ne.jp/dkfj/atomfeed"
opt = {}
opt['User-Agent'] = 'Opera/9.80 (Windows NT 5.1; U; ja) Presto/2.7.62 Version/11.01 '
xml = open(url, opt).read
doc = Nokogiri::XML(xml)

namespaces = {
  "atom" => "http://purl.org/atom/ns#",
  "dc" => "http://purl.org/dc/elements/1.1/"
}

entries = doc.xpath('//atom:entry', namespaces)
entries.each { |entry|
  puts entry.xpath('atom:title', namespaces).text
}
