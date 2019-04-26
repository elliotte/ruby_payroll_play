require 'calc_engine'
require 'company'

describe CalcEngine do 
      
      before(:each) do 
      	company = Company.new
      	@eng = CalcEngine.new(company)
      end

      it 'should have a default company with empty employee list' do
      	expect(@eng.company.current_period).to eq 1
      	expect(@eng.company.employees).to eq []
      end 

   #    it 'should have 0 employees' do
   #    end 

   #    it "should be able to receive an employee" do 
   #    	expect(@eng).to eq ""
   #    end

   #    it 'should know employee brought forward postion' do
   #    end

   #    it 'should know company current period' do
   #    end

   #    it' should check employee BF is 1 less than company CP' do 
   #    end
		
	  # it 'should run currnet period calc' do
	  # end

end