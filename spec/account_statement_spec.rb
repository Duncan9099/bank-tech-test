# frozen_string_literal: true

require_relative '../lib/account_statement'

describe 'statement' do
  subject(:statement) { Statement.new }

  let(:transaction) {
    double :transaction,
    date: '01/01/2019',
    credit: 500,
    debit: nil,
    account: 500
  }

  let(:transaction2) {
    double :transaction2,
    date: '01/01/2019',
    credit: nil,
    debit: 200,
    account: 300
  }

  describe '#view_statement' do
    it 'statement prints one transaction' do
      transaction_list = [transaction]
      expect { statement.view_statement(transaction_list) }.to output(
        "01/01/2019 || 500 ||  || 500\n"
      ).to_stdout
    end

    it 'statement prints two transactions' do
      transaction_list = [transaction2, transaction]
      expect { statement.view_statement(transaction_list) }.to output(
        "01/01/2019 || 500 ||  || 500\n01/01/2019 ||  || 200 || 300\n"
      ).to_stdout
    end
  end
end
