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
    return false if value < 0
    new_balance = calculate_balance_for_deposit(value)
    transaction.deposit(date, value, new_balance)
    @transaction_history.push(transaction)
  end

  def withdrawal(date, value, transaction = Transaction.new)
    return false if balance_insufficient(value) || value_is_negative(value)
    new_balance = calculate_balance_for_withdrawal(value)
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

  def calculate_balance_for_withdrawal(value)
    @account -= value
  end

  def calculate_balance_for_deposit(value)
    @account += value
  end

  def value_is_negative(value)
    value < 0
  end

  def balance_insufficient(value)
    @account < value
  end
end
