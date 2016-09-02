# -*- coding: utf-8 -*-
require 'cgi'

def parse(page_source)
  dates = page_source.scan(%r!(\d+)年 ?(\d+)月 ?(\d+)日<br />!)

  url_titles = page_source.scan(
    %r!^<a href="(.+?)">(.+?)</a><br />!
  )

  url_titles.zip(dates).map{|(aurl, atitle), ymd|
    [CGI.unescapeHTML(aurl), CGI.unescapeHTML(atitle), Time.local(*ymd)]
  }
end

def format_text(title, url, url_title_ary)
  s = "Title: #{title}\nURL: #{url}\n\n"
  url_title_ary.each do |aurl, atitle, atime|
    s << "* (#{atime})#{atitle}\n"
    s << "   #{aurl}\n"
  end
  s
end

x = parse(`/usr/bin/wget -q -O- http://crawler.sbcr.jp/samplepage.html`)

puts format_text("WWW.SBCR.JP TOPICS", "http://crawler.sbcr.jp/samplepage.html", x)
