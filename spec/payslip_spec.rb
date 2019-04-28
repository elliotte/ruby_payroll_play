require 'payslip'

describe Payslip do 
      
      before(:each) do 
        @payslip = Payslip.new
      end

      it 'should have defaults' do
        defaults = {
  				gross_pay: 0,
  				nics: 0,
  				paye_20: 0,
  				paye_40: 0,
  				emers_nics: 0,
  				emee_pension: 0,
  				emer_pension: 0
		    }
        expect(@payslip.bf).to eq(defaults)
        expect(@payslip.cp).to eq(defaults)
        expect(@payslip.cf).to eq(defaults)
      end

      it 'can calc brought forwards for 3 periods' do
         @payslip.run_annual_schema(25000)
         @payslip.build_brought_forward(3)
         expect(@payslip.bf[:paye_20]).to eq 416
         expect(@payslip.bf[:nics]).to eq 326
         expect(@payslip.bf[:paye_40]).to eq 0
         # @payslip.run_annual_schema(100000)
         # @payslip.build_brought_forward(3)
         # expect(@payslip.bf[:paye_20]).to eq 20000
         # expect(@payslip.bf[:paye_40]).to eq 40000
      end

      it 'can calc current month' do
         @payslip.run_annual_schema(25000)
         @payslip.build_current_month
         expect(@payslip.cp[:paye_20]).to eq 208
         expect(@payslip.cp[:nics]).to eq 163
         expect(@payslip.cp[:paye_40]).to eq 0
      end

      it 'can sum carried forward' do
         @payslip.run_annual_schema(25000)
         @payslip.build_brought_forward(3)
         @payslip.build_current_month
         @payslip.build_carried_forward
         expect(@payslip.cf[:paye_20]).to eq 624
         expect(@payslip.cf[:nics]).to eq 489
         expect(@payslip.cf[:paye_40]).to eq 0
      end
      
end

