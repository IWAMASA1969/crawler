# -*- coding: utf-8 -*-
TMP="/tmp/test.txt"

open(TMP, "w"){|f| f.puts "あいうえお".encode("Shift_JIS")}

File.read(TMP)  # =>

unmatched = open(TMP, &:read)  # =>
unmatched.encoding  # =>
unmatched.force_encoding("Shift_JIS").encode("UTF-8")  # =>
unmatched  # =>

sjis = open(TMP, "r:Shift_JIS", &:read)  # =>
sjis.encoding  # =>
sjis.encode("UTF-8")  # =>

utf8 = open(TMP, "r:Shift_JIS:UTF-8", &:read)  # =>
utf8.encoding  # =>

require 'kconv'
File.read(TMP).toutf8  # =>
NKF.nkf("-wm0", File.read(TMP))   # =>

File.unlink TMP
