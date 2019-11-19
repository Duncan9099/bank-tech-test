# frozen_string_literal: true

require_relative '../lib/transaction'

describe 'transaction' do
  subject(:transaction) { Transaction.new }

  describe '#deposit' do
    it 'transaction records deposit of 500 dollars on 01/01/2019' do
      transaction.deposit('01/01/2019', 500)
      expect(transaction.date).to eq('01/01/2019')
      expect(transaction.credit).to eq(500)
    end

    it 'transaction records deposit of 1000 dollars on 01/01/2019' do
      transaction.deposit('01/01/2019', 1000)
      expect(transaction.date).to eq('01/01/2019')
      expect(transaction.credit).to eq(1000)
    end

    it 'transaction records deposit of 700 dollars on 02/02/2019' do
      transaction.deposit('02/02/2019', 700)
      expect(transaction.date).to eq('02/02/2019')
      expect(transaction.credit).to eq(700)
    end
  end

  describe '#withdrawal' do
    it 'transaction records withdrawal of 500 dollars on 01/01/2019' do
      transaction.withdrawal('01/01/2019', 500)
      expect(transaction.date).to eq('01/01/2019')
      expect(transaction.debit).to eq(500)
    end

    it 'transaction records withdrawal of 1000 dollars on 01/01/2019' do
      transaction.withdrawal('01/01/2019', 1000)
      expect(transaction.date).to eq('01/01/2019')
      expect(transaction.debit).to eq(1000)
    end

    it 'transaction records withdrawal of 700 dollars on 02/02/2019' do
      transaction.withdrawal('02/02/2019', 700)
      expect(transaction.date).to eq('02/02/2019')
      expect(transaction.debit).to eq(700)
    end
  end
end
