class Minimum_of_Two
	def initialize(file)
		@data=IO.read(file)
		@data=@data.gsub!(/^\d*\n/,"")
	end
	
	def min()
		result=Array.new
		@data.each_line do |line|
			line=line.split(' ')
			if line[0].to_i>line[1].to_i
				result.insert(-1,line[1])
			else
				result.insert(-1,line[0])
			end
		end
		return result
	end
	
	def write(array)
		filename='4_output.txt'
		File.open(filename, 'w') do |file|
			file.puts array
		end
	end
end

m = Minimum_of_Two.new('4_input.txt')
puts m.write(m.min)