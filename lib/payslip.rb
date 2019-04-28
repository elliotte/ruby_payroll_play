require 'employee_tax'

class Payslip
	
	attr_reader :bf, :cp, :cf, :annual_schema

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
	@annual_schema = {}

	end

	def run_annual_schema annual_salary
		calculator = EmployeeTax.new(annual_salary)
		@annual_schema = {
			paye_20: calculator.paye_20,
			paye_40: calculator.paye_40,
			paye_45: 0,
			nics: calculator.nics,
			emers_nics: calculator.employers_nics
		}
	end

	def build_brought_forward current_period
		bf_multipler = current_period-1
		@bf = {
			paye_20: (@annual_schema[:paye_20]/12*bf_multipler),
			paye_40: (@annual_schema[:paye_40]/12*bf_multipler),
			paye_45: 0,
			nics: (@annual_schema[:nics]/12*bf_multipler),
			emers_nics: (@annual_schema[:emers_nics]/12*bf_multipler)
		}
	end

	def build_current_month
		@cp = {
			paye_20: (@annual_schema[:paye_20]/12),
			paye_40: (@annual_schema[:paye_40]/12),
			paye_45: 0,
			nics: (@annual_schema[:nics]/12),
			emers_nics: (@annual_schema[:emers_nics]/12)
		}
	end

	def build_carried_forward
		@cf = @bf.merge(@cp){ |k, a_value, b_value| a_value + b_value }
	end

	def check_if_brought_foward_difference
		## then smooth methods
	end

end

#clean up - move into new file
