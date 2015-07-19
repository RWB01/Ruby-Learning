class Arithmetic_Progression
	def initialize(file)
		@data=IO.read(file)
		@data=@data.gsub!(/^\d*\n/,"")
	end
	
	def arProg(a,b,n)
		summ=0
		(0..(n-1)).each do |i|
			summ = summ+a+b*i
		end
		return summ;
	end
	
	def solution()
		result=Array.new
		@data.each_line do |x|
			x=x.split(' ')
			result.insert(-1,arProg(x[0].to_i,x[1].to_i,x[2].to_i))
		end
		return result
	end
	
	def write(array)
		filename='8_output.txt'
		File.open(filename, 'w') do |file|
			file.puts array
		end
	end
end

a = Arithmetic_Progression.new('8_input.txt')
a.write(a.solution)
STDIN.getc