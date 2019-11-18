require_relative '../lib/transaction'

describe 'transaction' do

  before(:each) do
    @transaction = Transaction.new
  end

  describe '#deposit' do
    it 'transaction records deposit of 500 dollars on 01/01/2019' do
      @transaction.deposit("01/01/2019", 500)
      expect(@transaction.get_transaction).to eq(["01/01/2019", 500])
    end

    it 'transaction records deposit of 1000 dollars on 01/01/2019' do
      @transaction.deposit("01/01/2019", 1000)
      expect(@transaction.get_transaction).to eq(["01/01/2019", 1000])
    end

    it 'transaction records deposit of 700 dollars on 02/02/2019' do
      @transaction.deposit("02/02/2019", 700)
      expect(@transaction.get_transaction).to eq(["02/02/2019", 700])
    end
  end

  describe '#withdraw' do
    it 'transaction records withdrawal of 500 dollars on 01/01/2019' do
      @transaction.withdrawal("01/01/2019", -500)
      expect(@transaction.get_transaction).to eq(["01/01/2019", -500])
    end

    it 'transaction records withdrawal of 1000 dollars on 01/01/2019' do
      @transaction.withdrawal("01/01/2019", -1000)
      expect(@transaction.get_transaction).to eq(["01/01/2019", -1000])
    end

    it 'transaction records withdrawal of 700 dollars on 02/02/2019' do
      @transaction.withdrawal("02/02/2019", -700)
      expect(@transaction.get_transaction).to eq(["02/02/2019", -700])
    end
  end
end


# time = Time.new(2019, 1, 1).strftime("%d/%m/%Y")
# allow(Time).to receive(:now).and_return time
