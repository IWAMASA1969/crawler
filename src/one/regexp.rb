# -*- coding: utf-8 -*-
"abc123" =~ /\d+/            # =>
"abc123" =~ /xyz/            # =>

"abc123"[/\d+/]              # =>
"abc123"[/xyz/]              # =>

"abc123"[/^[a-z]+(\d+)/, 1]  # =>

"abc123"[/(.?).+/, 1]        # =>
"abc123"[/(.??).+/, 1]       # =>
"abc123"[/(.+).+/, 1]        # =>
"abc123"[/(.+?).+/, 1]       # =>

"abc123".sub(/abc/, 'def')   # =>
"abc123".sub(/[a-z]+/){|s| s.upcase}   # =>

"abc123".gsub(/[a-z]/, 'a'=>'x', 'b'=>'y', 'c'=>'z')  # =>

type =
  case "abc123"
  when /^def/
    :def
  when /^abc/
    :abc
  else
    :other
  end
type                         # =>

html = '<a href="a.html">a</a><a href="b.html">b</a>'
html                         # =>

html[%r!<a href="(.+)"(.+)</a>!, 1]         # =>
html[%r!<a href="(.+?)"(.+?)</a>!, 1]       # =>
html[%r!<a href="([^\"]+)">([^<]+)</a>!, 1] # =>
