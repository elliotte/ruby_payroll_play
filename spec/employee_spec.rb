require 'employee'

describe Employee do 
      
      before(:each) do 
        @ee = Employee.new 
      end

      it "should say have a defaults set" do 
        expect(@ee.full_name).to eq "MissingName"
        expect(@ee.salary).to eq 0
        expect(@ee.payslip_carried_forward).to eq({})
      end

      it 'should create with 0 gross pay and tax year to date' do 
        expect(@ee.gross_pay).to eq 0
        expect(@ee.tax_ytd).to eq 0
      end

      it 'should have a default brought forward payslip' do
        expect(@ee.bf_payslip).to eq(
            {:emee_pension=>0, 
             :emer_nics=>0, 
             :emer_pension=>0, 
             :gross_pay=>0, 
             :nics=>0, 
             :paye=>0
            }
        )
      end

      it 'should roll forward payslip' do
      end

      # it 'can calc annual template' do
      #    calc = @ee.extrapolate_annual_template(75000)
      #    expect(calc).to eq({})
      # end
      
end