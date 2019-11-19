# frozen_string_literal: true

class Statement
  def view_statement(transaction_history)
    all_transactions = []
    transaction_history.reverse.map do |transaction|
      all_transactions.push(
        "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.account}"
      )
    end
    puts all_transactions
  end
end
