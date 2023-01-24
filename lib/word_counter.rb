require_relative "../lib/config"

def file_to_list(filename)
  res = []
  File.open(filename, "r") do |file|
    file.each_line do |line|
      res << line.strip
    end
  end
  res.uniq
end


def init_dict(list)
  list.to_h {|word| [word, 0]}
end

def word_counter(st, dic)
  st.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ').each_with_object(dic) do |word, counter|
    if dic.include?(word) then counter[word] += 1 end
  end
end

def word_counter_file(filename, dic)
  File.open(filename, "r") do |lines|  
    lines.each_line do |line|
      dic = word_counter(line, dic)
    end
  end
  dic
end


puts word_counter_file("../lib/shakespeare.txt", init_dict(file_to_list("../lib/swearWords.txt")))
