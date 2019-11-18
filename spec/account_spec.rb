require_relative '../lib/account'

describe 'account' do

  subject(:account) { Account.new }
  let(:transaction) { double :transaction }
  let(:another_transaction) { double :transaction }
  let(:statement) { double :statement }

  describe '#get_balance' do
    it 'shows the balance at zero on initialization' do
      expect(account.get_balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'a deposit of 500 increases account balance by 500' do
      allow(transaction).to receive(:deposit).with("01/01/2019", 500, 500)
      account.deposit(transaction, "01/01/2019", 500)

      expect(account.get_balance).to eq(500)
      expect(account.transaction_history).to eq([transaction])
    end

    it 'a deposit of 100 increases account containing 500 to 600' do
      allow(transaction).to receive(:deposit).with("01/01/2019", 500, 500)
      allow(another_transaction).to receive(:deposit).with("01/01/2019", 100, 600)

      account.deposit(transaction, "01/01/2019", 500)
      account.deposit(another_transaction, "01/01/2019", 100)

      expect(account.get_balance).to eq(600)
      expect(account.transaction_history).to eq([transaction, another_transaction])
    end
  end

  describe '#withdrawal' do
    it 'a withdrawal of 100 decreases account containing 500 to 400' do
      allow(transaction).to receive(:deposit).with("01/01/2019", 500, 500)
      allow(another_transaction).to receive(:withdrawal).with("01/01/2019", 100, 400)

      account.deposit(transaction, "01/01/2019", 500)
      account.withdrawal(another_transaction, "01/01/2019", 100)

      expect(account.get_balance).to eq(400)
      expect(account.transaction_history).to eq([transaction, another_transaction])
    end

    it 'a withdrawal of 500 returns false for an account with less than 500 dollars' do
      allow(another_transaction).to receive(:withdrawal).with("01/01/2019", 100, 400)

      account.withdrawal("01/01/2019", 500)

      expect(account.get_balance).to eq(0)
      expect(account.transaction_history).to eq([])
    end
  end

end
