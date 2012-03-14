#!/usr/bin/env ruby
load 'lib/forvo.rb'

a = Forvo.download(ARGV.first)
puts a
