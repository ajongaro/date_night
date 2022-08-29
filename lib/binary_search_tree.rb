# frozen_string_literal: true

require './lib/tree_node'

# Building a BST
class BinarySearchTree
  attr_accessor :root, :depth, :size

  def initialize
    @root = nil
    @depth = 0
    @size = 0
    @inorder_list = []
  end

  def insert(score, title)
    if !root
      @root = TreeNode.new(score, title)
      self.size += 1
      depth
    else
      node = root
      parent_node = node
      self.depth = 0

      # find the appropriate nil node
      until !node
        if score < node.score
          parent_node = node
          node = node.left
        elsif score > node.score
          parent_node = node
          node = node.right
        elsif score == node.score
          return 'Score already exists.'
        end
        self.depth += 1
      end

      # add new node in nil spot
      if score < parent_node.score
        parent_node.left = TreeNode.new(score, title)
        self.size += 1
        depth
      elsif score > parent_node.score
        parent_node.right = TreeNode.new(score, title)
        self.size += 1
        depth
      end
    end
  end

  def include?(score = nil)
    return false if !root

    node = root
    until !node
      if score < node.score
        node = node.left
      elsif score > node.score
        node = node.right
      elsif score == node.score
        return true
      end
    end
    false
  end

  def depth_of(score)
    return 0 if score == root.score

    node = root
    self.depth = 0
    until !node
      if score < node.score
        node = node.left
      elsif score > node.score
        node = node.right
      elsif score == node.score
        return depth
      end
      self.depth += 1
    end
    depth
  end

  def max
    return nil if !root

    node = root
    result = nil
    while !result
      if !node.right
        result = node
      else
        node = node.right
      end
    end
    {result.title => result.score}
  end

  def min
    return nil if !root

    node = root
    result = nil
    while !result
      if !node.left
        result = node
      else
        node = node.left
      end
    end
    {result.title => result.score}
  end

  def sort
    @inorder_list = []
    traverse(root)
    @inorder_list
  end

  # I understand about 90% of why this works 8/30/22
  def traverse(node)
    if !node.nil?
      traverse(node.left)
      @inorder_list << {node.title => node.score}
      traverse(node.right)
    end
  end

  def load(movie_list)
    size = 0
    File.readlines(movie_list, chomp: true).each do |x|
      array = x.split(",")
      self.insert(array[0].to_i, array[1].strip)
      size += 1
    end
    size
  end

  # this is copied from Odin Project, I understand 85% of it 8/30/22
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.score}, #{node.title}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

# tree = BinarySearchTree.new
# tree.insert(50, 'Hannibal Buress: Animal Furnace')
# tree.insert(61, "Bill & Ted's Excellent Adventure")
# tree.insert(32, 'Police Academy')
# tree.insert(10, 'GIGLi')
# tree.insert(60, 'Sharknado')
# tree.insert(55, 'TMNT: 2')
# tree.insert(1, 'Batman')
# tree.insert(3, 'Spice World')
#
# tree.pretty_print
