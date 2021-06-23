require 'rails_helper'

RSpec.describe User, type: :model do
  
  u = User.new(name: "Wilmar", email:"w@gmail.com", password: 'XFgf52Q')

  describe 'User succesfully created' do

    it 'has a name' do
      expect(u.name).to be_present
      expect(u.name).to eq("Wilmar")
    end

    it 'has an email' do
      expect(u.email).to be_present
      expect(u.email).to eq("w@gmail.com")
    end

    it 'has a valid email' do
      expect(u.email).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
    end

    it 'has a password' do
      expect(u.password).to be_present
      expect(u.password).to eq("XFgf52Q")
    end
  end
end
