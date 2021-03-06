# -*- coding: utf-8 -*-
require 'anemone'

urls = [
  "https://www.amazon.co.jp/gp/bestsellers/books/",
  "https://www.amazon.co.jp/gp/bestsellers/digital-text/2275256051/"
]

Anemone.crawl(urls, :depth_limit => 1, :skip_query_strings => true) do |anemone|
  anemone.focus_crawl do |page|
    page.links.keep_if do |link|
      link.to_s.match(/\/gp\/bestsellers\/books|\/gp\/bestsellers\/digital-text/)
    end
  end

  anemone.on_every_page do |page|
    puts page.url
  end
end
