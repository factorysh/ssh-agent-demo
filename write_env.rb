#!/usr/bin/env ruby

File.open('.env', 'w') do |f|
  f.write('SECRET=')
  for line in IO.readlines('demo') do
    f.write line[0..-2]
    f.write '\\n'
  end
end
