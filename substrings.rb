def substrings(text_data, dictionary)
    text_data = text_data.gsub(/\W/, " ")
    text_data = text_data.downcase.split()
    puts text_data
    results = Hash.new(0)
    text_data.each do |test|
        dictionary.each do |word|
            if test.include?(word)
                results[word] += 1
            end
        end
    end
    return results
end
