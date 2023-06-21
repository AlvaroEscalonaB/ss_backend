require 'rails_helper'

RSpec.describe FavoriteCatFact, type: :model do

  # let(:cat_fact) { CatFact.new(fact: 'Random fact') }
  context 'Validations' do
    subject { FavoriteCatFact.new(user_id: User.create(name: 'Random').id, cat_fact_id: CatFact.create(fact: 'Random fact').id) }
    it { should validate_uniqueness_of(:cat_fact_id).scoped_to(:user_id).ignoring_case_sensitivity }
  end

  context 'Associations' do
    it { should belong_to(:cat_fact) }
    it { should belong_to(:user) }
  end
end
