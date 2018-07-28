class BankAccount
@@interest_rate = 3.5
@@accounts=[]

def initialize
@balance=0
end

def self.create
 new_accounts=self.new
 @@accounts<<new_accounts
 return new_accounts
end

def self.total_funds
  sum = 0
  @@accounts.each do |a|
    sum+=a.balance
  end
  return sum

end

def self.interest_time
  @@accounts.each do |a|
  a.balance = a.balance * @@interest_rate
end

end

def balance
 return @balance
end

def balance=(balance)
  @balance = balance
end

def balance
return @balance
end

def deposit(amount)
 @balance += amount
end

def withdraw (amount)
 @balance -=amount
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
