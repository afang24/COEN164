class Template
    attr_accessor :filtered_template
    def initialize(*arg)
        @filtered_template= []
        i = 0
        File.open("#{arg[0]}", "r") do |file|           #open file for reading
            file.readlines.each do |line|
                @filtered_template[i] = line
                i += 1
            end
        end
    end

    def filter
        filtered_string = ""
        (0..(@filtered_template.length())).each do |a|
            if (@filtered_template[a].to_s.include?("<%"))      #checks to see if it includes signs identifying as ruby
                next
            else
                filtered_string += @filtered_template[a].to_s
            end
        end
        return filtered_string
    end
end