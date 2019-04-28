require 'calc_engine'
require 'company'
require 'employee'
require 'payslip'

describe CalcEngine do 
      
      before(:each) do 
      	@company = Company.new
         @employee = Employee.new
         @employee.salary = 40000
      	@eng = CalcEngine.new(@company)
         @payslip = Payslip.new
      end

      it 'should have a default company with empty employee list' do
      	expect(@eng.company.current_period).to eq 1
      	expect(@eng.company.employees).to eq []
      end 

      it "should be able to load an employee" do 
      	expect(@employee.salary).to eq 40000
         @eng.load_company(@employee)
         expect(@eng.company.employees.count).to eq 1
      end

      it 'can run a employee pay slip' do
         result = @eng.run_employee_payslip(40000)
         result.should be_kind_of(Payslip)
      end

end