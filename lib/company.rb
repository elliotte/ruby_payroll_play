class Company

	attr_reader :current_period, :employees, :bf

	def initialize(
		co_hse_number="NI123456C",
		employer_ref="JL000007A",
		employer_paye_no="CCD1235r231",
		current_period=1,
		brought_forward = {
			employee_nics: 0,
			employee_paye: 0,
			employers_nics: 0,
			employee_pensions: 0,
			employer_pensions: 0,
			payments_ytd: 0
			}
		)
		# @co_hse_number = co_hse_number
		# @employer_ref = employer_ref
		# @employer_paye = employer_paye_no
		@current_period = current_period
		@bf = brought_forward
		@cf = {}
		@payments = {}

		@employees = []
	end

end