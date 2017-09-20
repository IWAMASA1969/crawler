# -*- coding: utf-8 -*-
require 'anemone'

urls = [
  "https://www.amazon.co.jp/gp/bestsellers/books/466282/",
  "https://www.amazon.co.jp/gp/bestsellers/books/466298/",
  "https://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/",
  "https://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/"
]

Anemone.crawl(urls, :depth_limit => 0, :skip_query_strings => true) do |anemone|
  anemone.focus_crawl do |page|
    page.links.keep_if do |link|
      link.to_s.match(/\/gp\/bestsellers\/books|\/gp\/bestsellers\/digital-text/)
    end
  end

  anemone.on_every_page do |page|
    puts page.url
  end
end
