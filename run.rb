require 'rubygems'
require 'bundler/setup'

require 'pry'
require 'mini_magick'

require './langolier'

l1 = Langolier.new 'test1.jpg'
l2 = Langolier.new 'test2.jpg'

l1.degrade
l2.degrade
