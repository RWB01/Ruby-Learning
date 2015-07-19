class Summ_in_Loop
	def initialize(file)
		@data=IO.read(file)
		@data=@data.gsub(/\d*\n/,'')
		@data=@data.split(' ')
	end
	
	def summ()
	result=0
		@data.each do |x|
			result += x.to_i
		end
	return result
	end
end
s=Summ_in_Loop.new('2_input.txt')
puts s.summ
STDIN.getc