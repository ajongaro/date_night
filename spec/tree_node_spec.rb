require 'tree_node'

RSpec.describe TreeNode do
  describe '#initialize' do
    it 'exists' do
      node = TreeNode.new(37, 'Sharknado')

      expect(node).to be_an_instance_of(TreeNode)
    end

    it 'takes a score and movie title' do
      node = TreeNode.new(37, 'Sharknado')

      expect(node.score).to eq(37)
      expect(node.title).to eq('Sharknado')
    end
  end
end
