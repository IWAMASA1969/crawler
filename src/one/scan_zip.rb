# -*- coding: utf-8 -*-
html = <<XXXX
<p>1993年2月24日
<a href="http://www.ruby-lang.org/ja/">Ruby's birthday</a></p>
<p>2014年1月1日
<a href="http://www.wxample.com/">元日</a></p>
XXXX
html  # =>

dates = html.scan(/(\d+)年(\d+)月(\d+)日$/)  # =>
links = html.scan(%r!<a href="(.+?)">(.+?)</a></p>!)  # =>

(0...dates.length).map{|i| [dates[i], links[i]]}  # =>
dates.zip(links)  # =>
