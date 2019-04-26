class Company

	attr_reader :current_period, :employees

	def initialize(
		co_hse_number="NI123456C",
		employer_ref="JL000007A",
		employer_paye_no="CCD1235r231",
		current_period=1,
		employees = []
		)

		@co_hse_number = co_hse_number
		@employer_ref = employer_ref
		@employer_paye = employer_paye_no
		@current_period = current_period
		@employees = []
	end

end