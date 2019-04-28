class EmployeeTax

	attr_reader :salary, :tax_free_allowance, :taxable

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
		#extend for higher rate taxpayers
	end

	def employers_nics
		primary_threshold = 8632
		if @salary >= primary_threshold
		  ((@salary-primary_threshold)*0.138).to_i
		end
		#extend for higher rate taxpayers
	end

end

