class Node
  
  def initialize(value)
  	@value = value
  	@parent = nil
  	@child_left = nil
  	@child_right = nil
  end

  def value
  	@value
  end

  def get_parent
  	@parent
  end

  def get_child_l
  	@child_left
  end

  def get_child_r
  	@child_right
  end

  def set_parent(node)
  	@parent = node
  end

  def set_child_l(node)
  	@child_left = node
  end

  def set_child_r(node)
  	@child_right = node
  end
end

def build_tree(arr, left=[], right=[])
	return Node.new(arr[0]) if arr.length == 1
	root = Node.new(arr[arr.length/2])
	arr.delete(root.value)
	arr.each do |val|
		val < root.value ? left << val : right << val
	end
	root.set_child_l(build_tree(left)) if left.length > 0
	root.set_child_r(build_tree(right)) if right.length > 0
	#left = arr[0..arr.length/2-1]
	#right = arr[arr.length/2+1..arr.length]
	#if left.length == 1
	#	if left[0] < root.value
	#		root.set_child_l(build_tree(left))
	#		root.set_child_r(build_tree(right)) if right.length > 0
	#	else
	#		root.set_child_l(build_tree(right)) if right.length > 0
	#		root.set_child_r(build_tree(left))
	#	end
	#else

	#end



	#root.set_children(build_tree(left)) if left.length > 0
	#root.set_children(build_tree(right)) if right.length > 0
	#root.set_children(arr[0..arr.length/2-1])
	#root.set_children(arr[arr.length/2+1..arr.length])
	root
end

p build_tree([2,1])
p build_tree([3,2,1])
p build_tree([5,1,2,7,3,1,6,2,4])

#node1 = Node.new(5)
#p node1.value
#p node1.get_children
#p node1.set_children(2)
#p node1.get_children

