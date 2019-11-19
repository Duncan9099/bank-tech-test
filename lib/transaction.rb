# frozen_string_literal: true

class Transaction
  attr_accessor :date, :credit, :debit, :account
  def initialize
    @date = nil
    @credit = nil
    @debit = nil
    @account = nil
  end

  def deposit(date, value, balance = 0)
    @date = date
    @credit = '%.2f' % value
    @account = '%.2f' % balance
  end

  def withdrawal(date, value, balance = 0)
    @date = date
    @debit = '%.2f' % value
    @account = '%.2f' % balance
  end
end
