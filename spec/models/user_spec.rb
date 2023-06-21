require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:role) }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end

  describe 'Associations' do
    it { should have_many(:favorite_cat_facts) }
    it { should have_many(:cat_facts) }
  end

  describe 'Role enums' do
    it { should define_enum_for(:role).with_values(%i[common admin]) }
  end
end
