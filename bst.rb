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

class Tree

  def initialize(values)
  	@root = build_tree(values)
  end

  def root
  	@root
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
	root
  end

  def breadth_first_search(target, queue=[])
  	queue << @root
  	if @root.value == target
  		return @root
  	else
  		while !queue.empty?
  		  a = queue.shift
  		  unless a.get_child_l.nil?
  		    if a.get_child_l.value == target
  		  	  return a.get_child_l
  		  	else
  		  	  queue << a.get_child_l
  		  	end
  		  end
  		  unless a.get_child_r.nil?
  		    if a.get_child_r.value == target
  		  	  return a.get_child_r
  		  	else
  		  	  queue << a.get_child_r
  		  	end
  		  end
  	    end
  	end
  end


end

t = Tree.new([5,1,7,3,6,2,4])
#p t

p t.breadth_first_search(1)

#p build_tree([2,1])
#p build_tree([3,2,1])
#p build_tree([5,1,2,7,3,1,6,2,4])
