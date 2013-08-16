require 'net/http'

save_path = './Pictures/drmcninja/'

current_page = 1
current_chapter = 0
pages_by_chapter = [14,22,45,48,42,52,0,12,49,34,56,56,5,47,72,73,5,89,6,6,79,107,5,96,3,114,30]

#good_url_arr = IO.read("good_mcninja.txt").split(' ')
bad_url_arr = IO.read("bad_mcninja.txt").split(' ')

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

def log_bad(bad_url)
  File.open('bad_mcninja.txt', 'a') do |f|
    f << (bad_url + " ")
  end
end

def log_good(good_url)
  File.open('good_mcninja.txt', 'a') do |f|
    f << (good_url + " ")
  end
end

def attempt(url_path, file_path, bad_arr)
  is_bad = (bad_arr.include? url_path)
  if !is_bad && get_image(url_path, file_path)
    log_good url_path
    return true 
  else
    log_bad url_path unless is_bad
    return false
  end
end

9.times do |year|
  y_s = (year + 2004).to_s
  12.times do |mnth|
    m_s = (mnth+1).to_s
    m_s = "0"+m_s if m_s.length == 1
    31.times do |day|
      d_s = (day+1).to_s
      d_s = "0"+d_s if d_s.length == 1

      url_path = '/comics/'+y_s+'-'+m_s+'-'+d_s+'-'+current_chapter.to_s+'p'+current_page.to_s+'.jpg'
      file_path = save_path +current_chapter.to_s+'p'+current_page.to_s+'.jpg'
      if attempt url_path, file_path, bad_url_arr
        current_page+=1
      else
        url_path = '/comics/'+y_s+'-'+m_s+'-'+d_s+current_chapter.to_s+'p'+current_page.to_s+'.jpg'
        if attempt url_path, file_path, bad_url_arr
          current_page+=1
        else
          url_path = '/comics/'+y_s+'-'+m_s+'-'+d_s+'-'+current_chapter.to_s+'p'+current_page.to_s+'.gif'
          file_path = save_path +current_chapter.to_s+'p'+current_page.to_s+'.gif'
          if attempt url_path, file_path, bad_url_arr
            current_page+=1
          else
            url_path = '/comics/'+y_s+'-'+m_s+'-'+d_s+current_chapter.to_s+'p'+current_page.to_s+'.gif'
            if attempt url_path, file_path, bad_url_arr
              current_page+=1
            else
              url_path = '/comics/'+y_s+'-'+m_s+'-'+d_s+'-'+current_chapter.to_s+'p'+current_page.to_s+'.png'
              file_path = save_path +current_chapter.to_s+'p'+current_page.to_s+'.png'
              if attempt url_path, file_path, bad_url_arr
                current_page+=1
              else
                url_path = '/comics/'+y_s+'-'+m_s+'-'+d_s+current_chapter.to_s+'p'+current_page.to_s+'.png'
                if attempt url_path, file_path, bad_url_arr
                  current_page+=1
                end
              end
            end
          end
        end
      end
      if current_page > pages_by_chapter[current_chapter]
        current_page = 1
        current_chapter+=1
        current_chapter+=1 if current_chapter ==6
      end
    end
  end
end
