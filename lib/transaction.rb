
class Transaction
  def initialize
    @full_transaction = []
  end

  def deposit(date, amount)
    @full_transaction.push(date, amount)
  end

  def withdrawal(date, amount)
    @full_transaction.push(date, amount)
  end

  def get_transaction
    return @full_transaction
  end
end
