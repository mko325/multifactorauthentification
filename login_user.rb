require 'json'
require 'digest/md5'

puts "email?"
email = gets.chomp
puts "password?"
password = gets.chomp
hashed_password = Digest::MD5.hexdigest(password)

f = File.open("./json_data", "r")
json_string = f.read
data = JSON.parse(json_string)
record = data[email]
if record == nil
  puts "Invalid Email"
  exit
elsif hashed_password !=record["password"]
  puts "Invalid Password"
  exit
end

numbers = (1..4).to_a.sample
if numbers == 1
  puts "What is your favorite color?"
  fav_color = gets.chomp
  if fav_color !=record["favorite_color"]
    puts "ERROR! INVALID LOGIN"
    exit
  end
end
  if numbers == 2
    puts "What is your favorite animal?"
    fav_animal = gets.chomp
    if fav_animal !=record["favorite_animal"]
      puts "ERROR! INVALID LOGIN"
      exit
    end
  end
  if numbers == 3
    puts "What was your first concert?"
    first_concert = gets.chomp
    if first_concert !=record["first_concert"]
      puts "ERROR! INVALID LOGIN"
      exit
    end
  end
  if numbers == 4
    puts "What was the name of your first pet?"
    first_pet = gets.chomp
    if first_pet !=record["first_pet"]
      puts "ERROR! INVALID LOGIN"
      exit
    end
  end


puts "Login Successful"
