#!/usr/bin/env ruby
# usage: ./download-comics.rb [comic-name (eg star-wars-bounty-hunters)] [path/to/save/pictures]

require 'net/http'
require 'restclient'
require 'date'
require 'nokogiri'

def do_script
  raise `head -n 2 ./download-comics.rb` if ARGV[0].nil? || ARGV[1].nil? || ARGV[0].to_s == "" || ARGV[1].to_s == ""

  index_link = "https://comiconlinefree.net/comic/#{ARGV[0]}"
  index_page = Nokogiri::HTML(RestClient.get(index_link))
  issues = index_page.css('div.container .container-left ul.basic-list a.ch-name')
  issues.each do |issue|
    issue_page = Nokogiri::HTML(RestClient.get(issue['href'] + "/full"))
    imgs = issue_page.css('img.chapter_img')
    imgs.each do |img|
      src = img['data-original']
      puts img['alt']
      File.write("#{ARGV[1]}#{img['alt'].gsub(":", "").gsub(" ","_")}.png", RestClient.get(src).body)
    end
  end
end

do_script
