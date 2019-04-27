require 'employee'

describe Employee do 
      
      before(:each) do 
        @ee = Employee.new 
        @payslip = Payslip.new
      end

      it "should say have a defaults set" do 
        expect(@ee.full_name).to eq "MissingName"
        expect(@ee.salary).to eq 0
      end

      it 'should have a default payslip' do
        defaults = {
          gross_pay: 0,
          nics: 0,
          paye_20: 0,
          paye_40: 0,
          emers_nics: 0,
          emee_pension: 0,
          emer_pension: 0
        }
        expect(@payslip.bf).to eq( defaults )
      end

      it 'should have a default brought forward payslip' do
        expect(@ee.payslip).to eq(
            {}
        )
      end

      it 'should have a current period payslip' do
        expect(@ee.payslip).to eq(
          {}
        )
      end
      
end