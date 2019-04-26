class CalcEngine

	attr_reader :company, :employees

	def initialize (company)
		@company = company
	end

	def open_employee employee
		employees << employee
	end

end
