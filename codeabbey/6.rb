class Rounding
	def initialize(file)
		@data=IO.read(file)
		@data=@data.gsub!(/^\d*\n/,"")
	end
	
	def parse_float(value)
		x, y = value.to_s.split('.')
		x, y = x.to_f, ('0.'+y).to_f
		return x, y
	end
	
	def round()
		result=Array.new
		@data.each_line do |line|
			line=line.split(' ')
			div,mod= parse_float(line[0].to_f/line[1].to_f)			
			if (mod>0.5) && (div>0)
				result.insert(-1,(div.to_i + 1))
			elsif (mod<0.5) && (div<0)
				result.insert(-1,(div.to_i))
			elsif (mod<0.5) && (div>0)
				result.insert(-1,(div.to_i))
			else
				result.insert(-1,(div.to_i - 1))
			end
		end
		return result
	end
	
	def write(array)
		filename='6_output.txt'
		File.open(filename, 'w') do |file|
			file.puts array
		end
	end
end

r=Rounding.new('6_input.txt')
r.write(r.round)
STDIN.getc