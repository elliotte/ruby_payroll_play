require 'employee_tax'

describe EmployeeTax do 
      
      before(:each) do 
        @rate_20 = EmployeeTax.new(25000)
        @rate_20_50K = EmployeeTax.new(50000)
        @rate_40 = EmployeeTax.new(75000)
        @rate_40_80K = EmployeeTax.new(80000)
        @rate_40_100K = EmployeeTax.new(100000)
      end

      it 'has defaults for correct 19/20 bands' do
        #20% rate
        # https://listentotaxman.com/25000?
        expect(@rate_20.salary).to eq 25000
        expect(@rate_20.tax_free_allowance).to eq 12509
        expect(@rate_20.taxable).to eq 12491
        #40% rate
        # https://listentotaxman.com/75000?
        expect(@rate_40.salary).to eq 75000
        expect(@rate_40.tax_free_allowance).to eq 12509
        expect(@rate_40.taxable).to eq 62491
      end

      it 'can calc paye 20 percent range for over 50K' do
         tax = @rate_40.paye_20
         expect(tax).to eq 10000
      end

      it 'can calc paye 20 percent range for less 50K' do
         tax = @rate_20.paye_20
         expect(tax).to eq 2498
      end

      it 'can calc paye 40 percent range for less 50K' do
         tax = @rate_20.paye_40
         expect(tax).to eq 0
      end

      it 'can calc paye 40 percent range for over 80K' do
         tax = @rate_40_80K.paye_40
         expect(tax).to eq 6996
      end

      it '40 percent range tops at 20K' do
         tax = @rate_40_100K.paye_40
         expect(tax).to eq 20000
      end

      it 'can calc nics at 50K' do
         tax = @rate_20_50K.nics
         expect(tax).to eq 4964
      end

      it 'can calc employer nics' do
         tax = @rate_20_50K.employers_nics
         expect(tax).to eq 5708
      end

end

