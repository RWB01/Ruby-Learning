class Fahrenheit_to_Celsius
	def initialize(file)
		@data=IO.read(file)
		@data=@data.split(' ')
		@data.delete_at(0)
	end
	
	def parse_float(value)
		x, y = value.to_s.split('.')
		x, y = x.to_f, ('0.'+y).to_f
		return x, y
	end
	
	def conversion()
		result=Array.new
		@data.each do |x|
			div, mod = parse_float((x.to_f-32)*5/9)
			#puts "div: #{div},mod: #{mod}"
			if mod>0.5
				result.insert(-1, div.to_i+1)
			else
				result.insert(-1, div.to_i)
			end
		end
		return result
	end
	
	def write(array)
		filename='7_output.txt'
		File.open(filename, 'w') do |file|
			file.puts array
		end
	end
end

f=Fahrenheit_to_Celsius.new('7_input.txt')
f.write(f.conversion)
STDIN.getc