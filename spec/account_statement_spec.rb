require_relative '../lib/account_statement'

describe 'statement' do

  subject(:statement) { Statement.new }

  describe '#view_statement' do
    xit 'statement prints one transaction' do
      transaction_list = [["01/01/2019", 500, nil, 500]]

      # expect(statement.view_statement(transaction_list)).to include("date || credit || debit || balance")
      expect(statement.view_statement(transaction_list)).to include("01/01/2019 || 500 ||  || 500")
    end

    xit 'statement prints two transactions' do
      transaction_list = [["01/01/2019", 500, nil, 500], ["01/01/2019", nil, 200, 300]]

      # expect(statement.view_statement(transaction_list)).to include("date || credit || debit || balance")
      expect(statement.view_statement(transaction_list)).to include("01/01/2019 || 500 ||  || 500")
      expect(statement.view_statement(transaction_list)).to include("01/01/2019 ||  || 200 || 300")
    end
  end
end
