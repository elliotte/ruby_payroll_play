class CalcEngine

	attr_reader :company

	def initialize (company)
		@company = company
	end

	def load_company employee
		@company.employees << employee
	end
	#to seperate into load check template 
	#and load employee calc
	#then run financial control checker
	def load_employee_annual_template salary
		calc = PayrollTax.new(salary)
		deductions = {
			paye_20: calc.paye_20,
			paye_40: calc.paye_40,
			paye_45: 0,
			nics: 0,
		}
	end

end

class PayrollTax

	def initialize salary
		@salary = salary
		@tax_free_allowance = 12509
		@taxable = @salary - @tax_free_allowance
	end

	def employee_template
		{gross_pay: 0,
		tax_free_allowance: @tax_free_allowance,	
		deductions: {
			paye_20: 0,
			paye_40: 0,
			paye_45: 0,
			nics: 0,
		},
		net_wage: 0,
		emers_ni: 0
		}
	end

	def paye_20
	  if @salary >= 50000
		(50000*0.2).to_i
	  else
		(@taxable*0.2).to_i
	  end
	end

	def paye_40
	  return 0 if @salary <= 50000	
	  
	  if @salary < 100000
	  	((@taxable-50000)*0.4).to_i
	  else
	  	(50000*0.4).to_i
	  end
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
