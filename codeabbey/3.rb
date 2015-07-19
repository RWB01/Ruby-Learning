class Sums_in_Loop

	def initialize(file)
		@data=IO.read(file)
		@data=@data.gsub!(/^\d*\n/,"")
	end
	
	def summs
		result=Array.new
		@data.each_line do |line|
			line=line.split(' ')
			tmp=0
			line.each do |x|
				tmp += x.to_i
			end
			result.insert(-1,tmp)
		end
		return result
	end
	
	def write(array)
		filename='3_output.txt'
		File.open(filename, 'w') do |file|
			file.puts array
		end
	end
end

s = Sums_in_Loop.new('3_input.txt')
puts s.write(s.summs)
STDIN.getc