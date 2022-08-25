# frozen_string_literal: true

require './lib/tree_node'

# BST structure
class BinarySearchTree
  attr_accessor :root, :depth, :size

  def initialize()
    @root = nil
    @depth = 0
    @size = 0
  end

  def insert(score, title)
    if @root == nil
      @root = TreeNode.new(score, title)
    else
      node = @root
      if score < node.score
        if node.left == nil
          node.left = TreeNode.new(score, title)
          node = node.left

          p 'added to left'
          p self
        end
      else # if >=
        if node.right == nil
          node.right = TreeNode.new(score, title)
          node = node.right

          p 'added to right'
          p self
        end
      end
    end
  end # Insert Method End
end # BST Class End


# tree = BinarySearchTree.new
# tree.insert(50, 'Hannibal Buress: Animal Furnace')
# tree.insert(61, "Bill & Ted's Excellent Adventure")
