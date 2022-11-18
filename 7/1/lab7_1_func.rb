# frozen_string_literal: true

def write_file(path, *words)
  if words.length <= 20
    File.open(path, 'w') do |file|
      words.each do |s|
        file.puts s
      end
    end
  elsif FileTest.exist?(path)
    File.delete(path)
  end
end

def read_file(path)
  output = ''
  if File.exist?(path)
    File.open(path, 'r') do |file|
      while (s = file.gets)
        output += "#{s[0..-2]} "
      end
    end
    return output[0..-2]
  end
  nil
end

def count(string)
  string.split(' ').count { |s| s.length == 2 }
rescue StandardError
  nil
end
