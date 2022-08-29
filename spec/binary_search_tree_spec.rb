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

    it 'adds a lesser score in @roots left node' do
      tree.insert(50, 'Hannibal Buress: Animal Furnace')
      expect(tree.root.score).to eq(50)
      expect(tree.root.title).to eq('Hannibal Buress: Animal Furnace')

      tree.insert(32, 'Police Academy')
      expect(tree.root.left.score).to eq(32)
      expect(tree.root.left.title).to eq('Police Academy')
    end

    it 'has a depth of 2 when depth is 2' do
      tree.insert(50, 'Hannibal')
      tree.insert(32, 'Police Academy')
      tree.insert(10, 'GIGLi')

      expect(tree.depth).to eq(2)
      expect(tree.size).to eq(3)
    end

    it 'goes 4 levels deep' do
      tree.insert(50, 'Hannibal')
      tree.insert(32, 'Police Academy')
      tree.insert(10, 'GIGLi')
      tree.insert(60, 'Sharknado')
      tree.insert(55, 'TMNT: 2')
      tree.insert(1, 'Batman')
      tree.insert(3, 'Spice World')

      expect(tree.depth).to eq(4)
      expect(tree.size).to eq(7)
    end

    it 'returns depth of insertion' do
      expect(tree.insert(50, 'Hannibal')).to eq(0)
      expect(tree.insert(32, 'Police Academy')).to eq(1)
      expect(tree.insert(10, 'GIGLi')).to eq(2)
    end

    it 'fails if score exists' do
      tree.insert(50, 'Hannibal')
      expect(tree.insert(50, 'Hannibal')).to eq('Score already exists.')
    end

  end

  describe '#include?' do
    it 'returns true or false' do
      expect(tree.include?).to be(true).or be(false)
    end

    it 'finds a score at root' do
      tree.insert(50, 'Hannibal')
      expect(tree.include?(50)).to be true
    end

    it 'returns true for a score at depth: 4' do
      tree.insert(50, 'Hannibal')
      tree.insert(32, 'Police Academy')
      tree.insert(10, 'GIGLi')
      tree.insert(60, 'Sharknado')
      tree.insert(55, 'TMNT: 2')
      tree.insert(1, 'Batman')
      tree.insert(3, 'Spice World')

      expect(tree.include?(3)).to be true
    end

    it 'returns false for no matching score' do
      tree.insert(50, 'Hannibal')
      tree.insert(32, 'Police Academy')
      tree.insert(10, 'GIGLi')
      tree.insert(60, 'Sharknado')

      expect(tree.include?(11)).to be false
    end
  end

  describe '#depth_of' do
    it 'returns the depth of a node' do
      tree.insert(50, 'Hannibal')
      tree.insert(32, 'Police Academy')
      tree.insert(10, 'GIGLi')
      tree.insert(60, 'Sharknado')
      tree.insert(55, 'TMNT: 2')
      tree.insert(1, 'Batman')
      tree.insert(3, 'Spice World')

      expect(tree.depth_of(3)).to eq(4)
    end

    it 'returns 0 for root node depth' do
      tree.insert(50, 'Hannibal')

      expect(tree.depth_of(50)).to eq(0)
    end
  end

  describe '#max' do
    it 'returns the highest score as key/value pair' do
      tree.insert(50, 'Hannibal')
      tree.insert(32, 'Police Academy')
      tree.insert(10, 'GIGLi')
      tree.insert(60, 'Sharknado')
      tree.insert(55, 'TMNT: 2')
      tree.insert(1, 'Batman')
      tree.insert(3, 'Spice World')

      expect(tree.max).to eq({ 'Sharknado' => 60 })
    end

    it 'returns root when only root exists' do
      tree.insert(50, 'Hannibal')

      expect(tree.max).to eq({ 'Hannibal' => 50 })
    end

    it 'returns nil when nothing exists' do
      expect(tree.max).to be(nil)
    end
  end

  describe '#min' do
    it 'returns the lowest score as key/value pair' do
      tree.insert(50, 'Hannibal')
      tree.insert(32, 'Police Academy')
      tree.insert(10, 'GIGLi')
      tree.insert(60, 'Sharknado')
      tree.insert(55, 'TMNT: 2')
      tree.insert(1, 'Batman')
      tree.insert(3, 'Spice World')

      expect(tree.min).to eq({ 'Batman' => 1 })
    end

    it 'returns root when only root exists' do
      tree.insert(50, 'Hannibal')

      expect(tree.min).to eq({ 'Hannibal' => 50 })
    end

    it 'returns nil when nothing exists' do
      expect(tree.min).to be(nil)
    end
  end
end
