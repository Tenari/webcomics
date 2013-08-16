require 'net/http'
# configure this to be the path to the folder where you want to save the images.
save_path = './Pictures/drmcninja/'
# configure this to be the path to the folder where you want to save the images.

def get_image(url_path, file_path)
  return true if File.exists? file_path
  retries = 3
  begin
    Net::HTTP.start('drmcninja.com') do |http|
      resp = http.get(url_path)
      unless resp.code == '404'
        File.open(file_path, 'w') do |file|
          file.write(resp.body)
          return true
        end
      end
    end
  rescue Exception
    retry if (retries -=1) > 0
  end
  return false
end

# make sure that this file "good_mcninja.txt" is saved in the same (root) directory as this script.
good_url_arr = IO.read("good_mcninja.txt").split(' ')
good_url_arr.each do |pic|
  get_image(pic, save_path)
end
