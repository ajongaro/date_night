require 'binary_search_tree'

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

    it 'adds a score and title' do
      tree.insert(50, 'Hannibal Buress: Animal Furnace')

      expect(tree.root.score).to eq(50)
      expect(tree.root.title).to eq('Hannibal Buress: Animal Furnace')
    end
  end

end
