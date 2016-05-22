require 'spec_helper'
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'validations' do 
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}

  end
end