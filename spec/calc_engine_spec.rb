require 'calc_engine'
require 'company'
require 'employee'

describe CalcEngine do 
      
      before(:each) do 
      	company = Company.new
         @employee = Employee.new
      	@eng = CalcEngine.new(company)
      end

      it 'should have a default company with empty employee list' do
      	expect(@eng.company.current_period).to eq 1
      	expect(@eng.company.employees).to eq []
      end 

      it "should be able to load an employee" do 
      	@eng.load_company(@employee)
         expect(@eng.company.employees.count).to eq 1
      end

end