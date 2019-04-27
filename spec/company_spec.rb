require 'company'

describe Company do 
      
      before(:each) do 
       @c = Company.new
      end

      it "should have defaults set" do 
         expect(@c.current_period).to eq 1
         expect(@c.bf).to eq(
         	{:employee_nics=>0, 
         	 :employee_paye=>0, 
         	 :employee_pensions=>0, 
         	 :employer_pensions=>0, 
         	 :employers_nics=>0,
         	 :payments_ytd=>0
         	}
         )
      end

       it "should have a list of employees empty" do 
         expect(@c.employees).to eq []
      end

end