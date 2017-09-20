require 'open-uri'

#url = "http://docs.ruby-lang.org/ja/2.1.0/doc/index.html"
url = "http://www.example.com/index.html"
open(url) {|f|
  f.each_line {|line| p line}
}
