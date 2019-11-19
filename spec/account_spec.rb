# frozen_string_literal: true

require_relative '../lib/account'

describe 'account' do
  subject(:account) { Account.new }
  let(:transaction) { double :transaction }
  let(:transaction2) { double :transaction }
  let(:statement) { double :statement }

  describe '#deposit' do
    it 'deposit of 500 increases balance by 500' do
      allow(transaction).to receive(:deposit).with('01/01/2019', 500, 500)
      account.deposit('01/01/2019', 500, transaction)
      expect(account.account).to eq(500)
      expect(account.transaction_history).to eq([transaction])
    end

    it 'deposit of 100 increases account from 500 to 600' do
      allow(transaction).to receive(:deposit).with('01/01/2019', 500, 500)
      allow(transaction2).to receive(:deposit).with('01/01/2019', 100, 600)
      account.deposit('01/01/2019', 500, transaction)
      account.deposit('01/01/2019', 100, transaction2)
      expect(account.account).to eq(600)
      expect(account.transaction_history).to eq([transaction, transaction2])
    end
  end

  describe '#withdrawal' do
    it 'withdrawal of 100 decreases account from 500 to 400' do
      allow(transaction).to receive(:deposit).with('01/01/2019', 500, 500)
      allow(transaction2).to receive(:withdrawal).with('01/01/2019', 100, 400)
      account.deposit('01/01/2019', 500, transaction)
      account.withdrawal('01/01/2019', 100, transaction2)
      expect(account.account).to eq(400)
      expect(account.transaction_history).to eq([transaction, transaction2])
    end

    it 'withdrawal of 500 returns false for account value < 500' do
      allow(transaction2).to receive(:withdrawal).with('01/01/2019', 100, 400)
      account.withdrawal('01/01/2019', 500)
      expect(account.account).to eq(0)
      expect(account.transaction_history).to eq([])
    end
  end
end
