class Employee

	attr_reader :full_name, :gross_pay, :tax_ytd, :bf_payslip, :salary, :payslip_carried_forward

	def initialize(

		full_name="MissingName",
		nino="JL000007A",
		gross_pay=0,
		tax_ytd=0,
		tax_code="BR",
		current_period=1, 
		annual_salary=0,
		brought_forward_payslip = {
			gross_pay: 0,
			nics: 0,
			paye: 0,
			emer_nics: 0,
			emee_pension: 0,
			emer_pension: 0
			}
		)

		@full_name = full_name
		@nino = nino
		@gross_pay = gross_pay
		@tax_ytd = tax_ytd
		@tax_code = tax_code
		@current_period = current_period
		@bf_payslip = brought_forward_payslip
		@salary = annual_salary
		@payslip_carried_forward = {}

	end

	def roll_foward_payslip
		# extrapolate_annual_template
		# load_brought_forward_payslip
		# calculate_employee_monthly_computation
		# build_carried_forward
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
