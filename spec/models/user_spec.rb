require 'rails_helper'

describe User do
    it 'works' do
        user = FactoryBot.create(:user, name: "Dasha")
        expect(user.name).to eq "Dasha"
        expect(user.valid?).to eq true
    end
end