require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール登録' do
    context 'プロフィールが登録できるとき' do
      it '全ての情報が入力されていれば登録できる' do
        expect(@profile).to be_valid
      end
      it 'degreeが空でも登録できる' do
        @profile.degree = ''
        expect(@profile).to be_valid
      end
      it 'affiliationが空でも登録できる' do
        @profile.affiliation = ''
        expect(@profile).to be_valid
      end
      it 'research_fieldsが空でも登録できる' do
        @profile.research_fields = ''
        expect(@profile).to be_valid
      end
      it 'contactが空でも登録できる' do
        @profile.contact = ''
        expect(@profile).to be_valid
      end
      it 'educationが空でも登録できる' do
        @profile.education = ''
        expect(@profile).to be_valid
      end
      it 'academic_affiliationsが空でも登録できる' do
        @profile.academic_affiliations = ''
        expect(@profile).to be_valid
      end
      it 'imageが空でも登録できる' do
        @profile.image = nil
        expect(@profile).to be_valid
      end
    end

    context 'プロフィールが登録できないとき' do
    end
  end
end
