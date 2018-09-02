class BankAccount
  @@interest_rate = 1.01
  @@accounts = []
  #  CLASS METHODS
  def self.create
  new_account = BankAccount.new
  @@accounts << new_account
  return new_account
  end
  def self.total_funds
    sum = 0
    @@accounts.each do |object|
      sum += object.balance
    end
    return sum
  end
  def self.interest_time
    index = 0
    @@accounts.each do |item|
      item.reasign_balance(item.balance * @@interest_rate)
      index += 1
    end
  end

  def initialize
    @balance = 0
  end

  def balance
    @balance
  end
        # WRITERS
  def deposit(amount)
    @balance += amount
  end
  def withdraw(amount)
    @balance -= amount
  end
  def reasign_balance(value)
    @balance = value
  end


end

 my_account=BankAccount.create
 your_account = BankAccount.create
  puts my_account.balance
  puts BankAccount.total_funds
  my_account.deposit(200)
  your_account.deposit(1000)
  puts my_account.balance
  puts your_account.balance
  puts BankAccount.total_funds

  BankAccount.interest_time
  puts my_account.balance
  puts your_account.balance
  puts BankAccount.total_funds
  my_account.withdraw(50)
  puts my_account.balance
  puts BankAccount.total_funds
