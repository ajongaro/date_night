



# Template to visualize how binary search tree inorder traversal works
def traverse(node)
  @times_recursed += 1
  local_times_recursed = @times_recursed
  print "Traversal #{local_times_recursed} opened.\n"
  if !node.nil?
    print "At #{node.score}, going left.\n"
    traverse(node.left) #left
    @inorder_list << {node.title => node.score} #visit
    print "Added #{{node.title => node.score}}, going right. x#{local_times_recursed}\n"
    traverse(node.right) #right
  end
  if node.nil?
    print "At nil node, "
  else
    print "On node #{node.score}, "
  end
  print "traversal #{local_times_recursed} closed.\n"
end



# Pretty Print Code
# this is copied from Odin Project, I understand 85% of it 8/30/22
def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.score}, #{node.title}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end
