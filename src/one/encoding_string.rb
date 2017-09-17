# -*- coding: utf-8 -*-
j = "るびぃ"      # =>
j.encoding        # =>
j.length          # =>
j.bytesize        # =>

e = j.encode("EUC-JP")   # =>
e.encoding        # =>

j+e rescue $!     # =>

"ruby".encode("UTF-8") + "ist".encode("EUC-JP")   # =>

j.force_encoding("ascii-8bit")    # =>
j.encoding        # =>

j.encode("UTF-8") rescue $!     # =>

require 'kconv'
j = j.toutf8      # =>
j.encoding        # =>

NKF.nkf("-w -m0", j)   # =>
