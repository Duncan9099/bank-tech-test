# frozen_string_literal: true

require_relative './transaction'
require_relative './account_statement'

class Account
  attr_reader :transaction_history, :account
  def initialize
    @account = 0
    @transaction_history = []
  end

  def deposit(date, value, transaction = Transaction.new)
    new_balance = @account += value
    transaction.deposit(date, value, new_balance)
    @transaction_history.push(transaction)
  end

  def withdrawal(date, value, transaction = Transaction.new)
    return false if @account < value

    new_balance = @account -= value
    transaction.withdrawal(date, value, new_balance)
    @transaction_history.push(transaction)
  end

  def view_statement(statement = Statement.new)
    title
    statement.view_statement(@transaction_history)
  end

  private

  def title
    puts 'date || credit || debit || balance'
  end
end
