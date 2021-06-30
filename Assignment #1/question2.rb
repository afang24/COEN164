class StudentSearch
    def search_students(students, record)
        final = []

        # loop through the hash array
        for student in students 
            if student[:firstname] == record[:firstname] || student[:lastname] == record[:lastname] || student[:phonenumber] == record[:phonenumber]
                final << student 
            end 
        end 
        if !final.empty?          #while final array not empty
            puts "First Name\t|\tLast Name\t|\tPhone#{}"
            final.each {|result| print result[:firstname], "\t\t\t", result[:lastname], "\t\t\t", result[:phonenumber], "\n"}
            puts
        else 
            puts "First Name\t|\tLast Name\t|\tPhone#{}"
            puts "no match\n"       #if no students with any name matches print error
        end 
    end
end 