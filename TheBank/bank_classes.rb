class Customer

 attr_accessor :name, :location

 def inititalize(name, location)
   @name = name
   @location = location
 end

end

class Account

  attr_reader :acct_number, :balance
  attr_accessor :customer, :acct_type

  def inititalize(customer,  balance, acct_number, acct_type)
    @Customer
    @balance
    @acct_number
    @acct_type
  end
  def deposit
    puts "How much would you like to deposit?"
    print "$"
    amount = gets.chomp.to_f
    @balance += amount
    puts "Your new balance is $#{'%.2f'%(balance)}"
  end

  def withdrawl
    puts "How much would you like to withdraw today?"
    print "$"
    amount = gets.chomp.to_f
    if @balance < amount
      @balance -= (amount + 25)
    else
      @balance -= amount
    end
    puts "your new balance is $#{'%0.2f'%(balance)} "
  end
end
