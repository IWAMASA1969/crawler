# -*- coding: utf-8 -*-
require 'anemone'

urls = []
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466282/")
urls.push("https://news.yahoo.co.jp/")

Anemone.crawl(urls, :depth_limit => 0) do |anemone|
  anemone.on_every_page do |page|
    puts page.doc.xpath('//title').text
  end
end
