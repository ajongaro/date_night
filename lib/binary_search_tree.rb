# frozen_string_literal: true

require './lib/tree_node'

# Building a BST
class BinarySearchTree
  attr_accessor :root, :depth

  def initialize
    @root = nil
  end

  def insert(score, title)
    depth = 0
    if !root
      @root = TreeNode.new(score, title)
      depth
    else
      node = root
      parent_node = node

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
        depth += 1
      end

      # add new node in nil spot
      add_new_node(score, title, parent_node)
      depth
    end
  end

  def add_new_node(score, title, parent_node)
    if score < parent_node.score
      parent_node.left = TreeNode.new(score, title)
    elsif score > parent_node.score
      parent_node.right = TreeNode.new(score, title)
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
    depth = 0
    until !node
      if score < node.score
        node = node.left
      elsif score > node.score
        node = node.right
      elsif score == node.score
        return depth
      end
      depth += 1
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

  def size
    sort.count
  end

    # write a method for this
  def depth

  end

  # uses recursive inorder traversal to sort the list
  def sort
    @inorder_list = []
    traverse(root)
    @inorder_list
  end

  def traverse(node)
    if node
      traverse(node.left) #left
      @inorder_list << {node.title => node.score} #record
      traverse(node.right) #right
    end
  end

  # loads a list from a text file
  def load(movie_list)
    size = 0
    File.readlines(movie_list, chomp: true).each do |x|
      array = x.split(",")
      self.insert(array[0].to_i, array[1].strip)
      size += 1
    end
    size
  end

  def health(level)
    node_result = []
    level_result = []

    # take level as argument (0 - n)

    # find first node at that level
    # note the score as array[0]
    # traverse the tree below that node
    # note that count + 1 as array[1]
    # divide that count over total number of nodes
    # note that result as array[2]

    # add that array to the result array

    # repeat for any other nodes at depth level
    # return result array

  end
end
