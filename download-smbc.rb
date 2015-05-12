#!/usr/bin/env ruby
# usage: ./download-smbc.rb [anything]

require 'net/http'
require 'date'


def do_script
  (Date.parse("2002-09-05")..Date.today).each do |day|
    print "#{day}\t"
    Net::HTTP.start("smbc-comics.com") do |http|
      resp = http.get("/comics/#{day.to_s.gsub("-","")}.gif")
      if resp.code == "404"
        Net::HTTP.start("smbc-comics.com") do |http2|
          resp = http.get("/comics/#{day.to_s.gsub("-","")}-2.gif")
          if resp.code != "404"
            File.write("./smbc/#{day.to_s}.png",resp.body)
          end
        end
      else
        File.write("./smbc/#{day.to_s}.png",resp.body)
      end
    end
  end
end

do_script
