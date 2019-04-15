RSpec.describe QueueList do
  let(:list) { described_class.new }
  let(:node_one) do
    node = QueueList.new
    node.value = 1
    node
  end
  let(:node_two) do
    node = QueueList.new
    node.value = 2
    node
  end
  let(:node_three) do
    node = QueueList.new
    node.value = 3
    node
  end
  let(:node_four) do
    node = QueueList.new
    node.value = 4
    node
  end

  describe '#add' do
    context 'when there is no node' do
      it 'it adds a node at the beginning of the queue' do
        list.add(1)
        expect(list.head.value).to eql(1)
      end
    end
  end
end
