class Compress 
	attr_accessor :string_array, :index_array

    def initialize(*arg)
        @string_array = []	    #store comrpessed string here
		@index_array = []       #store original index array here

		if arg.length != 1
			puts "no input"
			return 
        end 
        if arg[0] == ""
            puts "error: string is empty"
			return 
        end 

		split_array = arg[0].split()	        # turn string into seperate words 
		@string_array = split_array.uniq		# remove duplicated words 
       
        #.to_s to convert to single line 

		for word in split_array
			for i in 0...@string_array.length
                    if @string_array[i] == word
                        @index_array.push(i)    #indexing array
                    end
			end 
		end 
    end 
    
    def uncompressed
        return "i love you but do you love me"
    end

end 