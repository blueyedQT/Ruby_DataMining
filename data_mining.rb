require 'open-uri'
require 'nokogiri'

puts "Enter a site"
url = gets.chomp
page = Nokogiri::HTML(open(url))
sentances = page.css('p').collect{ |node| node.text }.join(" ")
words = sentances.downcase.split(/\W+/).each_with_object(Hash.new(0)) { |e, h| h[e] += 1 }
words = words.sort_by {|k, v| v}.reverse.first(10)
puts words