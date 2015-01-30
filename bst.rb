class Node
  
  def initialize(value)
  	@value = value
  #	@parent = nil
  	@left = nil
  	@right = nil
  end

  def value
  	@value
  end

  #def get_parent
  #	@parent
  #end

  def left_child
  	@left
  end

  def right_child
  	@right
  end

  #def set_parent(node)
  #	@parent = node
  #end

  def set_left(node)
  	@left = node
  end

  def set_right(node)
  	@right = node
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
	root = Node.new(arr[arr.length/2])
	arr.delete(root.value)
	arr.each do |val|
		val < root.value ? left << val : right << val
	end
	root.set_left(build_tree(left)) if left.length > 0
	root.set_right(build_tree(right)) if right.length > 0
	root
  end

  def breadth_first_search(target, queue=[])
  	queue << @root
  	if @root.value == target
  		return @root
  	else
      while !queue.empty?
  		a = queue.shift
  		unless a.left_child.nil?
  		  if a.left_child.value == target
  		    return a.left_child
  		  else
  		    queue << a.left_child
  		  end
  		end
  		unless a.right_child.nil?
  		  if a.right_child.value == target
  		  	return a.right_child
  		  else
  		  	queue << a.right_child
  		  end
  	    end
  	  end
  	end
  end

  def depth_first_search(target, stack=[], visited=[])
  	stack << @root
  	visited << @root	

  	while !stack.empty?
  	  curr_node = stack.last
  	  return curr_node if curr_node.value == target

  	  if curr_node.left_child && !visited.include?(curr_node.left_child)
  	  	return curr_node.left_child if curr_node.left_child.value == target
  	  	stack << curr_node.left_child
  	  	visited << curr_node.left_child

  	  elsif curr_node.right_child && !visited.include?(curr_node.right_child)
  	  	return stack.last.right_child if stack.last.value == target
  	  	visited << stack.last.right_child
  	  	stack << stack.last.right_child

  	  else 
  	    stack.pop
  	  end
  	end  	
  end

  def dfs_rec(target, node=@root)
  	return node if node.value == target
  	a = dfs_rec(target, node.left_child) if node.left_child
  	b = dfs_rec(target, node.right_child) if node.right_child
  	a ? a : b
  end

end

t = Tree.new([0,1,2,3,4,5,6])

p t
p t.breadth_first_search(8)
p t.breadth_first_search(2)
p t.depth_first_search(0)
p t.depth_first_search(4)
p t.dfs_rec(6)
