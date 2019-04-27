class Payslip
	
	attr_reader :bf, :cp, :cf

	def initialize(
		brought_forward_payslip = {
				gross_pay: 0,
				nics: 0,
				paye_20: 0,
				paye_40: 0,
				emers_nics: 0,
				emee_pension: 0,
				emer_pension: 0
		},
		current_period_payslip = {
				gross_pay: 0,
				nics: 0,
				paye_20: 0,
				paye_40: 0,
				emers_nics: 0,
				emee_pension: 0,
				emer_pension: 0
		},
		carried_forward_payslip = {
				gross_pay: 0,
				nics: 0,
				paye_20: 0,
				paye_40: 0,
				emers_nics: 0,
				emee_pension: 0,
				emer_pension: 0
		}
	)

	@bf = brought_forward_payslip
	@cp = current_period_payslip
	@cf = carried_forward_payslip

	end

	def build_current_period annual_salary
		calculator = EmployeeTax.new(annual_salary)
		@cp = {
			paye_20: calculator.paye_20,
			paye_40: calculator.paye_40,
			paye_45: 0,
			nics: calculator.nics,
			emers_nics: calculator.employers_nics
		}
	end

end

#clean up - move into new file
class EmployeeTax

	def initialize salary
		@salary = salary
		@tax_free_allowance = 12509
		@taxable = @salary - @tax_free_allowance
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

	def nics
		lower_threshold = 6136
		primary_threshold = 8632
		# 12% up to 50K
		upper_threshold = 50000
		if @salary <= upper_threshold
			((@salary-primary_threshold)*0.12).to_i
		end
	end

	def employers_nics
		primary_threshold = 8632
		if @salary >= primary_threshold
		  ((@salary-primary_threshold)*0.138).to_i
		end
	end
	# def employee_template
	# 	{gross_pay: 0,
	# 	tax_free_allowance: @tax_free_allowance,	
	# 	deductions: {
	# 		paye_20: 0,
	# 		paye_40: 0,
	# 		paye_45: 0,
	# 		nics: 0,
	# 	},
	# 	net_wage: 0,
	# 	emers_ni: 0
	# 	}
	# end
end