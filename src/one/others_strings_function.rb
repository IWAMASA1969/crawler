# -*- coding: utf-8 -*-
format("%s %d URLs", "Download", 23)  # =>

"abc\n".chomp  # =>
"abc\n\n".chomp  # =>
"abc\n\n".chomp("")  # =>

"abcd".count("a")  # =>
"abcd".count("ab")  # =>
"abcd".count("a-c")  # =>

"abcd".count("a-c", "^b")  # =>

s = "ab\ncd\n"  # =>
s.lines.to_a  # =>
s.lines.map(&:chomp)  # =>
s.split("\n")  # =>

a = []
s.each_line{|l| a << l}
a  # =>

s = " ab cd ef "
s.split  # =>
s.split(nil, 2)  # =>
s.strip  # =>

"abc".chars.to_a  # =>
