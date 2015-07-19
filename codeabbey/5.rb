class Minimum_of_Three
	def initialize(file)
		@data=IO.read(file)
		@data=@data.gsub!(/^\d*\n/,"")
	end
	
	def min()
		result=Array.new
		@data.each_line do |line|
			line=line.split(' ')
			tmp=line[0].to_i
			line.each do |x|
				if x.to_i<tmp
					tmp=x.to_i
				end
			end
			result.insert(-1,tmp)
		end
		return result
	end
	
	def write(array)
		filename='5_output.txt'
		File.open(filename, 'w') do |file|
			file.puts array
		end
	end
end

m = Minimum_of_Three.new('5_input.txt')
puts m.write(m.min)