require_relative '../lib/account'

describe 'account' do
  subject(:account) { Account.new }
  describe '#get_balance' do
    it 'shows the balance at zero on initialization' do
      expect(account.get_balance).to eq(0)
    end
  end
end
