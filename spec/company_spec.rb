require 'company'

describe Company do 
      
      before(:each) do 
       @c = Company.new
      end

      it "should have default period as 1" do 
         expect(@c.current_period).to eq 1
      end

       it "should have a list of employees empty" do 
         expect(@c.employees).to eq []
      end

end