class Triangles
	def initialize(file)
		@data=IO.read(file)
		@data=@data.gsub!(/^\d*\n/,"")
		@data = @data..split('\n')
	end
	
	def canBuildTriangles?
		result = []
		@data.each do |d|
			result += canBuild?(d)
		end
		return result
	end
	
	def canBuild?(string)
		arr = string.split
		if ((arr[0]+arr[1])>arr[2]) || ((arr[0]+arr[2])>arr[1]) || ((arr[1]+arr[2])>arr[0])
			return 1
		else
			return 0
		end
	end 
	
	def write(array)
		filename='9_output.txt'
		File.open(filename, 'w') do |file|
			file.puts array
		end
	end
end

a = Triangles.new('9_input.txt')
a.write(a.canBuildTriangles?)
STDIN.getc