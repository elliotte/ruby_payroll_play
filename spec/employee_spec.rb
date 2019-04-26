require 'employee'

describe Employee do 
      
      before(:each) do 
      	 @ee = Employee.new 
      end

      it "should say have a default name" do 
         expect(@ee.full_name).to eq "MissingName"
      end

      it 'should create with 0 gross pay and tax year to date' do 
      	expect(@ee.gross_pay).to eq 0
      	expect(@ee.tax_ytd).to eq 0
      end
      
end