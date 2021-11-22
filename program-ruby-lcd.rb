# User:     Brayan Diaz C
# Email:    brayandiazc@gmail.com
# Date:     22-02-2021
# File:     program-ruby-lcd.rb
# Usage:    "ruby program-ruby-lcd.rb [-s SIZE] DIGITS"
# Input:    Numbers (0..9) and an optional size.
# Output:   Input numbers and variable size
# Example:  ruby ruby program-ruby-lcd.rb -s 1 0123456789

# Size defaults to 2.
# fc:       Focused content
# bs:       Both sides
# ls:       Left side
# rs:       Right side
# nc:       Null content

# Options #
s = $*.size > 1 ? $*.slice!(0..1)[1] : '2'
num = $*[0]

unless s =~ /^[1-9]\d*$/ and num =~ /^\d+$/
  puts "Usage: #$0 [-s SIZE] DIGITS"
  exit
end
s = s.to_i

# Rendering #
fc = ' ' + '-'*s + ' '     # ' - '
bs = ['|' + ' '*s + '|']*s # '| |'
ls = ['|' + ' '*s + ' ']*s # '|  '
rs = [' ' + ' '*s + '|']*s # '  |'
nc = ' ' * fc.size         # '   '

lcd = [
        [fc] << bs << nc << bs << fc, # 0
        [nc] << rs << nc << rs << nc, # 1
        [fc] << rs << fc << ls << fc, # 2
        [fc] << rs << fc << rs << fc, # 3
        [nc] << bs << fc << rs << nc, # 4
        [fc] << ls << fc << rs << fc, # 5
        [fc] << ls << fc << bs << fc, # 6
        [fc] << rs << nc << rs << nc, # 7
        [fc] << bs << fc << bs << fc, # 8
        [fc] << bs << fc << rs << fc, # 9
                                      ]

# output #
(0...(2*s+3)).each do |i|
  puts num.chars.collect { |n| lcd[n.to_i].flatten[i] }.join ' '
end
