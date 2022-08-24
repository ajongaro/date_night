class BinarySearchTree

end


tree = BinarySearchTree.new

tree.insert(61, "Bill & Ted's Excellent Adventure")
tree.insert(16, 'Johnny English')
tree.insert(92, 'Sharknado 3')
tree.insert(50, 'Hannibal Buress: Animal Furnace')


tree.include?(16)
tree.include?(72)

tree.depth_of(92)
tree.depth_of(50)

tree.max

tree.min

tree.sort

tree.load(movies.txt)
