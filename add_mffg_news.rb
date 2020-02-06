#!/usr/bin/ruby

# Copyright Foxrift / Boris Borgobello

def input(msg)
    print("#{msg} : ")
    fetched = STDIN.gets
    fetched.gsub("\n", '')
end

def await_user_enter(description = '')
    print("PRESS ENTER to #{description} ...")
    fetched = STDIN.gets
    nil
end

TMP_FILE = './tmptmptmp.txt'

title = Time.now.strftime("%d/%m/%y") + " - " + input("Title ?")

await_user_enter('specify body. Use - to list items')

system('vi', TMP_FILE)

result = File.read(TMP_FILE)
File.delete(TMP_FILE)

# Forge content

def basic_plain_transform data
    lines = data.split("\n")
    body = ""
    listing = false
    lines.each_with_index do |l, idx|
        if l.start_with?('- ')
            l = l.sub('- ', '')
            if !listing
                listing = true
                body += "<ul>\n<li>#{l}</li>\n"
            else
                body += "<li>#{l}</li>\n"
            end
        else
            if listing
                listing = false
                body += "</ul>\n#{l}\n"
            else
                body += "<br>" unless idx == 0
                body += "#{l}\n"
            end
        end
    end
    body += "</ul>\n" if listing
    body
end

body = basic_plain_transform(result)

result = "<h3>#{title}</h3>\n\n#{body}\n"

puts result

await_user_enter('OK')

# Update news

news_file = './pages/mffg/news.html'

data = File.read(news_file)

newses = data.split('<h3>')
result = result.gsub('<h3>', '')
newses.insert(1, result)

File.write(news_file, newses.join('<h3>'))

# Start verif

puts 'Starting jekyll server'
thr = Thread.new { `bundle exec jekyll s` }

sleep 10

`open "http://localhost:4000/mffg/news"`

await_user_enter('OK')

thr.kill