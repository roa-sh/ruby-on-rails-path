require 'rails_helper'

RSpec.describe "Articles", type: :request do
  it 'can access the articles' do
    get '/articles'
    expect(response).to have_http_status(:found) #302 http code = Found
  end

end