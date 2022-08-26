require 'binary_search_tree'
require 'tree_node'

RSpec.describe BinarySearchTree do
  let(:tree) { BinarySearchTree.new }

  describe '#initialize' do
    it 'exists' do
      expect(tree).to be_a(BinarySearchTree)
    end
  end

  describe '#insert' do
    it 'creates a new node' do
      tree.insert(61, "Bill & Ted's Excellent Adventure")

      expect(tree.root).to be_a(TreeNode)
    end

    it 'adds a score and title for root node' do
      tree.insert(50, 'Hannibal Buress: Animal Furnace')

      expect(tree.root.score).to eq(50)
      expect(tree.root.title).to eq('Hannibal Buress: Animal Furnace')
    end

    it 'has a size of one with one node' do
      tree.insert(50, 'Hannibal Buress: Animal Furnace')

      expect(tree.size).to eq(1)
    end

    it 'adds two scores and titles' do
      tree.insert(50, 'Hannibal Buress: Animal Furnace')

      expect(tree.root.score).to eq(50)
      expect(tree.root.title).to eq('Hannibal Buress: Animal Furnace')

      tree.insert(61, "Bill & Ted's Excellent Adventure")
      expect(tree.root.right.score).to eq(61)
      expect(tree.root.right.title).to eq("Bill & Ted's Excellent Adventure")
      expect(tree.root.left).to eq(nil)
    end

    it 'adds a lesser score title in left node of root' do
      tree.insert(50, 'Hannibal Buress: Animal Furnace')
      expect(tree.root.score).to eq(50)
      expect(tree.root.title).to eq('Hannibal Buress: Animal Furnace')

      tree.insert(32, 'Police Academy')
      expect(tree.root.left.score).to eq(32)
      expect(tree.root.left.title).to eq('Police Academy')
    end

    it 'has a depth of 2 when appropriate' do
      tree.insert(50, 'Hannibal')
      tree.insert(32, 'Police Academy')
      tree.insert(10, 'GIGLi')

      expect(tree.depth).to eq(2)
      expect(tree.size).to eq(3)
    end



  end
end
