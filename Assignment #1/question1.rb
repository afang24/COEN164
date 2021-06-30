class OccurenceCalculator
    def count_word(*args)
          if args[0].empty?        #string is empty
            puts "Error: no string input"
          else
            case args.size	
                when 1			#Hash case
                    results = args[0].downcase.scan(/\w+/).inject(Hash.new(0)) {|h, w| h[w] += 1; h}
                    puts "#{results}"
                when 2			#specific
                    count = args[0].downcase.scan(args[1]).count
                    puts "Word: \"#{args[1]}\" appears #{count} times."
                end          
            end             
    end 
end 