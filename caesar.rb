def cipher(st, nu)
    cipher = ""
    text_to_decode = st.split("")
    versus_list = [" ", ",", ".", ":", ";", "!", "?", '"', "'", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    text_to_decode.each do |letter|
	if versus_list.include?(letter)
	    cipher += letter
	else
	    1.upto(nu) do
                if letter == "z"
                    letter = "a"
                elsif letter == "Z"
                    letter = "A"
                else
                    letter = letter.next
                end
	    end
	    cipher += letter
        end
    end
    return cipher
end

