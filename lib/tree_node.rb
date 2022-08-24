# frozen_string_literal: true

# a node within a bst
class TreeNode
  attr_accessor :score, :title, :left, :right

  def initialize(score, title)
    @score = score
    @title = title
    @left = nil
    @right = nil
  end
end
