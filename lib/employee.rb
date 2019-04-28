class Employee
	attr_accessor :salary
	attr_reader :full_name, :payslip

	def initialize(

		full_name="MissingName",
		nino="JL000007A",
		tax_code="BR",
		current_period=1, 
		annual_salary=0
		)

		@full_name = full_name
		@salary = annual_salary
		@payslip = {}
	end
end

# Tax Due
# Net Pay
# Tax due to Date

# NIC Letter
# EE NIC
# ER NIC
# Total NIC
# EE Nic Rebate
# ER NIC Rebate
# Surplus Nic Rebate


