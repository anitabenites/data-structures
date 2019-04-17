RSpec.describe QueueList do
  let(:list) { described_class.new }

  describe '#enqueue' do
    context 'with no node' do
      it 'adds a node at the beginning of the queue' do
        list.enqueue(1)
        expect(list.head.value).to eql(1)
      end
    end

    context 'with one node' do
      before do
        list.enqueue(1)
      end
      it 'adds a new node after the one that was already there' do
        list.enqueue(2)
        expect(list.head.value).to eql(1)
        expect(list.tail.value).to eql(2)
        expect(list.tail.next).to be_nil
      end
    end

    context 'with more than 2 nodes' do
      it 'adds a new node in the queue' do
        list.enqueue(1)
        list.enqueue(2)
        list.enqueue(3)
        expect(list.head.value).to eql(1)
        expect(list.head.next.value).to eql(2)
        expect(list.tail.value).to eql(3)
        expect(list.tail.next).to be_nil
      end
    end
  end

  describe '#dequeue' do
    context 'with no node' do
      before do
        list.enqueue(1)
        list.enqueue(2)
        list.enqueue(3)
      end
      it 'does not raise an error' do
        expect { list.dequeue(4).not_to raise_error }
      end
    end

    context 'with one node' do
      before do
        list.enqueue(1)
      end
      it 'removes the only node in the queue' do
        list.dequeue(1)
        expect(list.head).to be_nil
        expect(list.tail).to be_nil
      end
    end

    context 'with more than 2 nodes' do
      before do
        list.enqueue(1)
        list.enqueue(2)
        list.enqueue(3)
      end
      it 'removes the first node of the queue' do
        list.dequeue(1)
        list.dequeue(2)
        expect(list.head.value).to eql(3)
        expect(list.tail.value).to eql(3)
        expect(list.tail.next).to be_nil
      end
    end
  end
end
