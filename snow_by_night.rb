require 'net/http'

save_path = './Pictures/snowbynight/'

def get_image(url_path, file_path)
  return true if File.exists? file_path
  retries = 3
  begin
    Net::HTTP.start('www.snowbynight.com') do |http|
      resp = http.get(url_path)
      unless resp.code == '404'
        File.open(file_path, 'w') do |file|
          file.write(resp.body)
        end
      end
    end
  rescue
    retry if (retries -=1) > 0
  end
end

6.times do |chapter|
  ch_str = (chapter+2).to_s
  28.times do |time|
    url_path = '/pages/ch'+ch_str+'/'+ch_str+'.'+(time+1).to_s+'.jpg'
    file_path = save_path + ch_str+'.'+(time+1).to_s+'.jpg'
    get_image url_path, file_path
  end
end

