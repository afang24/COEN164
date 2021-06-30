class Convo
	def speechDetection
        advisor_is_speaking = false	    #using a flag to check if advisor is speaking
        
		File.open("conversation.txt", "r") do |file|
			file.readlines.each do |line|
				if line.strip.empty?            #space between alternating speakers	
					advisor_is_speaking = false
				end 		
                if line.match("ADVISOR\:")
                    advisor_is_speaking = true  #set flag to true
                end      
                if(advisor_is_speaking == true) #print the line of advisor text if line match is true
                    puts line
                    puts ""
                end   
			end 
		end
	end 
end 

