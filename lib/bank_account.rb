require 'pry'
# require_relative '../lib/concerns/dependables.rb'


class BankAccount

	attr_reader :name
	attr_accessor :balance, :status

	def initialize(name)
		@name = name
		@balance = 1000
		@status = "open"
	end

	def status
		@status
	end

	def deposit(money)
		@balance += money
	end

	def display_balance
		"Your balance is $#{@balance}."
	end

	def valid_bal # HELPER METHOD #
		@balance > 0
	end

	def valid_status
		if @status == "open"
			true
		else
			false # HELPER METHOD #
		end
	end

	def valid?
		if valid_status && valid_bal
			true
		else
			false
		end
	end

	def close_account
		@status = "closed"
		@balance = 0
	end
end
