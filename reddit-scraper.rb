require 'open-uri'
require 'nokogiri'
require 'pry'

class Entry
	def initialize(title, link)
		@title = title
		@link = link
	end
	attr_reader :title
	attr_reader :link
end

doc = Nokogiri::HTML(open("https://www.reddit.com/"))

entries = doc.css('.entry')

entries.each do |entry|
	puts entry.css('p.title>a').text
	puts entry.css('p.title>a')[0]['href']
end

entrieArray = []

entries.each do |entry|
	title = entry.css('p.title>a').text
	link = entry.css('p.title>a')[0]['href']
	entriesArray << Entry.new(title, link)
end

Pry.start(binding)