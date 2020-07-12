BASE_MFFG_FOLDER = './pages/mffg'
BASE_NEWS = "#{BASE_MFFG_FOLDER}/news.html"

languages = Dir.glob("#{BASE_MFFG_FOLDER}/*").select {|f| File.directory? f}.map {|f| f.split('/').last } 

data = File.read(BASE_NEWS)
languages.each do |l|
    path = "#{BASE_MFFG_FOLDER}/#{l}/news.html"
    File.write(path, data.gsub('permalink: /mffg/news/', "permalink: /mffg/#{l}/news"))
end