#!/usr/bin/env ruby
require 'bundler'
Bundler.require :default
load 'lib/forvo.rb'

a = Forvo.download(ARGV.first)
puts a
