# Objective 1

#create hashed password
require 'digest/md5'
password = "password"
hashed_password = Digest::MD5.hexdigest(password)

#read data as a string
f = File.new("./lastnames.csv", "r")
last_names_string = f.read
f.close

#convert string of data into an array of data
last_names_row = last_names_string.split("\n")

#delete first two rows
first_row = last_names_row.shift[0]


emails = []
last_names_row.each do |data_point|
    last_names_individual = data_point.split(",")
    last_name = last_names_individual[0].to_s
    email = last_name.downcase + "@gmail.com"
    emails.push(email)
end

data = {}
emails.each do |email|
    record = {
        "password"=>hashed_password,
        "favorite_color"=>["purple", "orange", "green", "blue", "red"].sample,
        "favorite_animal"=>["cheetah", "tiger", "dog", "giraffe", "bird"].sample,
        "first_concert"=>["jingleball", "john mayer", "jonas brothers"].sample,
        "first_pet"=>["sophie", "rex", "spot", "fido"].sample
    }
data[email] = record
end

require 'json'
json_string = JSON.generate(data)

f = File.new("./json_data", "w")
f.write json_string
f.close