# frozen_string_literal: true

require './lib/tree_node'

# BST structure
class BinarySearchTree
  attr_accessor :root, :depth, :size

  def initialize()
    @root = nil
    @size = 0
  end

  def insert(score, title)
    if @root == nil
      @root = TreeNode.new(score, title)
      @size += 1
    else
      node = @root
      parent_node = node
      @direction = nil
      @depth = 0

      # find the appropriate nil node
      while node != nil
        if score < node.score
          parent_node = node
          node = node.left
        elsif score > node.score
          parent_node = node
          node = node.right
        else
          return 'Score already exists.'
        end
        @depth += 1
      end

      # add new node in nil spot
      if score < parent_node.score
        parent_node.left = TreeNode.new(score, title)
        @size += 1
      elsif score > parent_node.score
        parent_node.right = TreeNode.new(score, title)
        @size += 1
      else
        return 'Scoring error.'
      end
    end
  end
end # BST Class End


# tree = BinarySearchTree.new
# tree.insert(50, 'Hannibal Buress: Animal Furnace')
# require "pry"; binding.pry
# tree.insert(61, "Bill & Ted's Excellent Adventure")
