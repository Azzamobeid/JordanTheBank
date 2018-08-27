require_relative 'bank_classes'

@customers = []
@accounts = []

#welcome screen
def welcome_screen
    @current_customer = ""
    puts "Welcome to The Bank"
    puts "Please choose from the following:"
    puts "---------------------------"
    puts "1. Customer Sighn-In"
    puts "2. New Customerr Registration"
    choice = gets.chomp.to_i
    case choice
      when 1 then sign_in
      when 2 then sign_up("","")
    end
 end


def sign_in
  print "What's your name? "
  name = gets.chomp
  print "What's your location? "
  location = gets.chomp

  if @customers.empty?
    puts "No customer found with that information."
    sign_up(name, location)
  end

  customer_esist = fal se
  @customers.each do |customer|
    if name = vustomer.name && location == customer.location
      @current_customer = customer
      customer_exists = true
    end
  end
  if customer_exists
     account_menu
  else
    puts "No customer founf with that information."
    puts "1. Try agin?"
    puts "2. Sign Up"
    choice = gets.chomp.to_i
    case choice
    when 1 then sign_in
    when 2 then sign_up(name, location)
    end
  end
end

def sign_up(name, location)
  if name == "" && location == ""
    print "What's your name? "
    name = gets.chomp
    print "what's your location? "
    location = gets.chomp
  end
  @current_customer = Customer.new(name, location)
  @customers.push (@current_customer)
  puts "Registration successful"
  account_menu
end

def account_menu
  puts "Account Menu"
  puts "-----------"
  puts "1. Create an Account"
  puts "2. Review an Account"
  puts "3. Sign out"
  choice = gets.chomp.to_i
  case choice
  when 1 then create_account
  when 2 then review_account
  when 3 then
    puts "Thanks for banking with us."
    welcome_screen
  else
    puts "Invalid selection."
    account_menu
  end
end

def create_account
  print "How much will your initial deposit be? $"
  amount = gets.chomp.to_f
  print "What type of content will you be opening?"
  acct_type = gets.chomp
  new_acct = Ac count.new(@current_customer, amount, (@accounts.length+1), acct_type)
  @accounts.push(new_acct)
  puts "Account successfully created!"
  account_menu
end

def review_account
  @current_account = ""
  print "Which account (type) do you want to review?"
  type = gets.chomp.downcase
  account_exists = false
  @accounts.each do |account|
    if @current_customer = account.customer && type == account.acct_type.downcase
      @current_account = accounts
      account_exists = true
    end
end
  if account_exists
    current_account_actions
  else
    puts "Try again."
    review_account
  end
end

def current_account_actions
  puts "Choose from the following: "
  puts "--------------------------"
  puts "1. Balance Check"
  puts "2. Make a Deposit"
  puts "3. Make a withdrawl"
  puts "4. Return to Account Menu"
  puts "5. Sign Out"
  choice = gets.chomp.to_i
  case choice
  when 1
    puts "Current Balance is $#{'%o.2f'%(@current_account.balance)}"
    current_account_actions
  when 2
    @current_account.deposit
    current_account_actions
  when 3
    @current_account.withdrawl
    current_account_actions
  when 4 then review_account
  when 5 then welcome_screen
  else
    puts "Invalid selection."
    current_account_actions
  end
end
welcome_screen
