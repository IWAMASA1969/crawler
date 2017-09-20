# -*- coding: utf-8 -*-
require 'anemone'
require 'nokogiri'
require 'kconv'

urls = []
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466282/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/books/466298/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/")
urls.push("https://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/")

Anemone.crawl(urls, :depth_limit => 0, :skip_query_strings => true) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text
    sub_category = doc.xpath("//*[@id='zg_listTitle']/span").text

    puts category + "/" + sub_category
  end
end
