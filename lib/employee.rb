class Employee

	attr_reader :full_name, :gross_pay, :tax_ytd

	def initialize(

		full_name="MissingName",
		nino="JL000007A",
		gross_pay=0,
		tax_ytd=0,
		tax_code="BR",
		current_period=1, 
		brought_forward_payslip="")

		@full_name = full_name
		@nino = nino
		@gross_pay = gross_pay
		@tax_ytd = tax_ytd
		@tax_code = tax_code
		@current_period = current_period

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

end