# require_relative '../lib/concerns/dependables.rb'
require 'pry'

class Transfer
  # your code here
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  end

  def valid?
  	if @sender.valid? && @receiver.valid?
  		true
  	else
  	  false
    end
  end

  def execute_transaction
    if amount > self.sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "complete"
      "This transfer was already completed."
    else
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
    end
    self.status = "reversed"
  end
end
