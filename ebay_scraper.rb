require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

page = HTTParty.get('http://www.ebay.com/sch/i.html?_from=R40&_trksid=p2050601.m570.l1313.TR0.TRC0.H0.Xleif+nelson.TRS0&_nkw=leif+nelson&_sacat=0')

parse_page = Nokogiri::HTML(page)

cardigans_array = []

parse_page.css('.mainContent').css('.rsw').css('.vip') do |a|
	post_name = a.text
	cardigans_array.push(post_name)
end

Pry.start(binding)