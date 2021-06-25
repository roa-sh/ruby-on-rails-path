require 'rails_helper'

RSpec.describe "Users", type: :request do
  it "creates an user " do
    
    post '/users', params: { user: {name: 'pepe', email:'p@thefrog.com', password:'123456', password_confirmation:'123456'}}
    expect(response.body).to include '/users/1'
  end
end
