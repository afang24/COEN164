#!/usr/bin/ruby


#*********************************************Question #1***********************************************************
require_relative 'question1'
puts "-----------------Question #1-----------------"
puts ""


count = OccurenceCalculator.new()
puts "Searching for number of occurence of a word:"
str = %{Facebook and its founder must release documents and electronic correspondence to a defense lawyer whose client has fled from criminal charges that he falsely claimed a majority ownership in the social media giant, a federal judge said Friday.}
puts count.count_word(str, "to")

puts "Hashresult:"
str = %{Facebook and its founder must release documents and electronic correspondence to a defense lawyer whose client has fled from criminal charges that he falsely claimed a majority ownership in the social media giant, a federal judge said Friday.}
puts count.count_word(str)

puts "No String Input Example:"
str = %{}
puts count.count_word(str)


#*********************************************Question #2***********************************************************
require_relative 'question2'
puts "-----------------Question #2-----------------"
puts ""

students = [
        {:firstname => "John", :lastname => "LastnameJohn",  :phonenumber => 123456789},
        {:firstname => "Ken", :lastname => "Lastnameken",  :phonenumber => 456734244},
        {:firstname => "Marisa", :lastname => "lastnamemarisa",  :phonenumber => 443234567},
        {:firstname => "Ken", :lastname => "Kenlastname",  :phonenumber => 456734244},
        {:firstname => "Alex#1", :lastname => "Fang",  :phonenumber => 911},
        {:firstname => "Alex#2", :lastname => "Fang",  :phonenumber => 101010101}
]

search = StudentSearch.new()

puts "Students with last name: \"Fang\" ="
puts search.search_students(students, lastname: "Fang")

puts "The following students have phone number: \"123456789\""
puts search.search_students(students, phonenumber: 123456789)

puts "No students with the first name: \"Daniel\" goes to this school"
puts search.search_students(students, firstname: "Daniel")


#*********************************************Question #3***********************************************************
require_relative 'question3'
puts "-----------------Question #3-----------------"
puts ""

puts "Testing invalid arg:"
obj_tmp = Compress.new()
puts""

puts "Testing empty string:"
obj_tmp = Compress.new("")
puts""

obj = Compress.new("i love you but do you love me")

print "Uncompressed String: \n"
puts obj.uncompressed
puts""

print "Compressed String: \n"
puts obj.string_array
puts""

print "Check index array: \n"
puts obj.index_array
puts""



#*********************************************Question #4***********************************************************
require_relative 'question4'
puts "-----------------Question #4-----------------"
puts ""

puts"Filtered Template aka html w/o ruby in it"
filtered = Template.new("templateHTML.txt")
puts filtered.filter




#*********************************************Question #5***********************************************************
require_relative 'question5'
puts "-----------------Question #5-----------------"
puts ""

puts "Advisor Dialogue:\n "
advisor = Convo.new()
advisor.speechDetection()


