require 'spec_helper'

module LightspeedRestaurant
  describe Customer do
    setup_api_token

    subject { LightspeedRestaurant::Customer }

    it 'can fetch customers' do
      VCR.use_cassette('customers/list') do
        customers = subject.all
        expect(customers).to be_an(Array)
        expect(customers.count).to eq(4)

        customer = customers.first
        expect(customer).to be_a(LightspeedRestaurant::Customer)
        expect(customer.id).to eq(2365)
      end
    end

    it 'can fetch an customer by ID' do
      VCR.use_cassette('customers/find') do
        customer = subject.find(2366)
        expect(customer).to be_a(LightspeedRestaurant::Customer)
      end
    end

    context 'creating' do
      it 'with valid information' do
        VCR.use_cassette('customers/create') do
          customer = subject.create(firstName: 'test5', lastName: 'test5', email: 'test5@test.com')
          expect(customer).to be_a(LightspeedRestaurant::Customer)
          expect(customer.id).not_to be_nil
        end
      end

      it 'missing a email' do
        VCR.use_cassette('customers/create_invalid') do
          expect do
            subject.create(email: '')
          end.to raise_error(LightspeedRestaurant::APIError)
        end
      end
    end

    context 'updating' do
      it 'with valid information' do
        VCR.use_cassette('customers/find') do
          @customer = subject.find(2366)
        end
        VCR.use_cassette('customers/update') do
          @customer.email = 'test-update@test.com'
          @customer = @customer.save
          expect(@customer.email).to eq('test-update@test.com')
        end
      end

      it 'missing a email' do
        VCR.use_cassette('customers/find') do
          @customer = subject.find(2366)
        end
        VCR.use_cassette('customers/update_invalid') do
          expect do
            @customer.email = ''
            @customer.save
          end.to raise_error(LightspeedRestaurant::APIError)
        end
      end
    end
  end
end
