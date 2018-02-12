class Teste
	def oi
		puts "oi"
	end
end

x = Teste.new

#File.open("arquivo.txt",'w') do |f|
#Marshal.dump(x, f)
#end

#objeto = File.open("arquivo.txt") do |file|
#Marshal.load(file)
#end

require 'json'

x = Hash.new
x[:nome] = "teste"
x[:id] = 1

a  = JSON.generate(x)
b = JSON.parse(a)

puts x
puts a
puts b

#!/usr/bin/ruby

require 'sqlite3'

begin
    
    db = SQLite3::Database.open "test.db"
    db.execute "CREATE TABLE IF NOT EXISTS Cars(Id INTEGER PRIMARY KEY, 
        Name TEXT, Price INT)"
    db.execute "INSERT INTO Cars VALUES(1,'Audi',52642)"
    db.execute "INSERT INTO Cars VALUES(2,'Mercedes',57127)"
    db.execute "INSERT INTO Cars VALUES(3,'Skoda',9000)"
    db.execute "INSERT INTO Cars VALUES(4,'Volvo',29000)"
    db.execute "INSERT INTO Cars VALUES(5,'Bentley',350000)"
    db.execute "INSERT INTO Cars VALUES(6,'Citroen',21000)"
    db.execute "INSERT INTO Cars VALUES(7,'Hummer',41400)"
    db.execute "INSERT INTO Cars VALUES(8,'Volkswagen',21600)"
    
rescue SQLite3::Exception => e 
    
    puts "Exception occurred"
    puts e
    
ensure
    db.close if db
end
