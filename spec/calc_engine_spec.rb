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

      it 'can calc paye 20 percent range for over 50K' do
         calc = @eng.load_employee_annual_template(75000)
         expect(calc[:paye_20]).to eq 10000
      end

      it 'can calc paye 20 percent range for less 50K' do
         calc = @eng.load_employee_annual_template(25000)
         expect(calc[:paye_20]).to eq 2498
      end

      it 'can calc paye 40 percent range for less 50K' do
         calc = @eng.load_employee_annual_template(25000)
         expect(calc[:paye_40]).to eq 0
      end

      it 'can calc paye 40 percent range for over 80K' do
         calc = @eng.load_employee_annual_template(80000)
         expect(calc[:paye_40]).to eq 6996
      end

      it '40 percent range tops at 20K' do
         calc = @eng.load_employee_annual_template(100000)
         expect(calc[:paye_40]).to eq 20000
      end

      it 'can calc nics' do
         calc = @eng.load_employee_annual_template(45000)
         expect(calc[:nics]).to eq 4364
      end

      it 'can calc employer nics' do
         calc = @eng.load_employee_annual_template(45000)
         expect(calc[:emers_nics]).to eq 5018
      end

   #    it 'should know employee brought forward postion' do
   #    end

   #    it 'should know company current period' do
   #    end

   #    it' should check employee BF is 1 less than company CP' do 
   #    end
		
	  # it 'should run currnet period calc' do
	  # end

end