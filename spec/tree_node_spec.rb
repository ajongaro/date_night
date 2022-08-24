require 'tree_node'

RSpec.describe TreeNode do
  describe '#initialize' do
    let(:node) { TreeNode.new(37, 'Sharknado') }

    it 'exists' do
      expect(node).to be_an_instance_of(TreeNode)
    end

    it 'takes a score and movie title' do
      expect(node.score).to eq(37)
      expect(node.title).to eq('Sharknado')
    end

    it 'has a left and right class variable' do
      expect(node.left).to be nil
      expect(node.right).to be nil
    end
  end
end
