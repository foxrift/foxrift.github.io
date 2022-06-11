#!/usr/bin/ruby

def await_user_enter(description = '')
    print("PRESS ENTER to #{description} ...")
    fetched = STDIN.gets
    nil
end

# Start verif

puts 'Starting jekyll server'
thr = Thread.new { `bundle exec jekyll s` }

sleep 10

`open "http://localhost:4000/mffg/news"`

await_user_enter('OK')

thr.kill
