require 'spec_helper'
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'validations' do 
          let(:account) {FactoryGirl.create(:account, :subdomain=>'Test',:owner_id=>1)}
    it { should validate_presence_of :owner}
    it {should belong_to :owner}
    it { should validate_presence_of :subdomain}
    it { should validate_uniqueness_of :subdomain}
    it { should allow_value('bolandrm').for(:subdomain)}
    it {should_not allow_value('test').for(:subdomain)}
    it { should_not allow_value('www').for(:subdomain)}
    it {should_not allow_value('WWW').for(:subdomain) }
    it { should_not allow_value('.test').for(:subdomain)}
    it { should_not allow_value('test/').for(:subdomain)}
    it 'should validate case insensitive uniqueness' do
      expect(account).to_not be_valid
    end

  end

  # describe 'associations' do
  #   it  'should have owner'
  # end
end
