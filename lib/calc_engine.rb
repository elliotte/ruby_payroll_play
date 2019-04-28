require 'payslip'

class CalcEngine

	attr_reader :company

	def initialize (company)
		@company = company
	end

	def load_company employee
		@company.employees << employee
	end
	
	def run_employee_payslip annual_salary
	  @payslip = Payslip.new
	  @payslip.run_annual_schema(annual_salary)
      @payslip.build_brought_forward(@company.current_period)
      @payslip.build_current_month
      @payslip.build_carried_forward
      @payslip
	end

end


	# def run_annual
	#   #then you pay 20% on anything you earn between £12,501 and £50,000
	#   # payable_range_40 = paye_40
	#   #you’ll pay 40% Income Tax on earnings between £50,001 to £150,000
	#   # paye_40 = (150000 - taxable)*0.4
	#   # #if you earn £150,001 and over you pay 45% tax
	#   # paye_45 = ""
	#   deductions = {
	# 		paye_20: paye_20,
	# 		paye_40: 0,
	# 		paye_45: 0,
	# 		nics: 0
	#   }
	# end
