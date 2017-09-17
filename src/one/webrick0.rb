#!/usr/bin/env ruby
require 'webrick'
Thread.start{
  WEBrick::HTTPServer.new(
    DocumentRoot:".",
    Port:7777,
    BindAddress:"127.0.0.1"
  ).start
}
gets

# ruby -rwebrick -e 'Thread.start{WEBrick::HTTPServer.new(DocumentRoot:".",Port:7777,BindAddress:"127.0.0.1").start};gets'
