class Board
	attr_accessor :x, :y, :parent, :children

	def initialize(x, y, parent=nil)
		@x = x
		@y = y
		@parent = parent
		@children = []
	end

	def possible_children
		candidates = []
		candidates << [@x+1,@y+2]
		candidates << [@x+1,@y-2]
		candidates << [@x-1,@y+2]
		candidates << [@x-1,@y-2]
		candidates << [@x+2,@y+1]
		candidates << [@x+2,@y-1]
		candidates << [@x-2,@y+1]
		candidates << [@x-2,@y+1]
		children = candidates.select { |pos| pos[0] >= 0 && pos[1] >= 0 && pos[0] <= 7 && pos[1] <= 7}
		children = children.map {|child_coords| Board.new(child_coords[0], child_coords[1], self)}
		@children = children
	end
end

def get_search_obj(search_obj, root_obj)
	queue = []
	queue << root_obj
	loop do
		current = queue.shift
		return current if current.x == search_obj.x && current.y == search_obj.y
		current.possible_children.each {|child| queue << child }
	end
end

def knight_moves(start_arr, finish_arr)
	search_obj = Board.new(finish_arr[0], finish_arr[1])
	root_obj = Board.new(start_arr[0], start_arr[1])
	result = get_search_obj(search_obj, root_obj)

	route = []
	route.unshift([search_obj.x, search_obj.y])
	current = result.parent
	while current
		route.unshift([current.x, current.y])
		current = current.parent
	end
	puts "Shortest path achieved in #{route.length - 1} steps. Here's the route:"
	route.each {|square| square.to_s }
end

p knight_moves([0,0],[1,2])
p knight_moves([0,0],[3,3])
p knight_moves([3,3],[0,0])