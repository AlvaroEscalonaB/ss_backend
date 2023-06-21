require 'rails_helper'

RSpec.describe CatFact, type: :model do

  describe 'Attributes' do
    it { should respond_to(:fact) }
  end

  context 'Validations' do
    it { should validate_presence_of :fact }
    it { should validate_uniqueness_of :fact }
  end

  context 'Associations' do
    it { should have_many(:favorite_cat_facts) }
  end
end
