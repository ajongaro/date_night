# frozen_string_literal: true

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
      last_node = @root
    end
  end
end
