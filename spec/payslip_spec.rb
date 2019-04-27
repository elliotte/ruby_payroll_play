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
        expect(@payslip.bf).to eq( defaults )
        expect(@payslip.cp).to eq( defaults )
        expect(@payslip.cf).to eq( defaults )
      end

      it 'can calc paye 20 percent range for over 50K' do
         @payslip.build_current_period(75000)
         expect(@payslip.cp[:paye_20]).to eq 10000
      end

      it 'can calc paye 20 percent range for less 50K' do
         @payslip.build_current_period(25000)
         expect(@payslip.cp[:paye_20]).to eq 2498
      end

      it 'can calc paye 40 percent range for less 50K' do
         @payslip.build_current_period(25000)
         expect(@payslip.cp[:paye_40]).to eq 0
      end

      it 'can calc paye 40 percent range for over 80K' do
         @payslip.build_current_period(80000)
         expect(@payslip.cp[:paye_40]).to eq 6996
      end

      it '40 percent range tops at 20K' do
         @payslip.build_current_period(100000)
         expect(@payslip.cp[:paye_40]).to eq 20000
      end

      it 'can calc nics' do
         @payslip.build_current_period(45000)
         expect(@payslip.cp[:nics]).to eq 4364
      end

      it 'can calc employer nics' do
         @payslip.build_current_period(45000)
         expect(@payslip.cp[:emers_nics]).to eq 5018
      end
      
end