require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  it "Don't login" do
    post '/login', params: { session: {email: 'yy@gmail.com', password: '654321'}}
    expect(response.body).to include('Invalid email/password combination')
  end
  
  let(:user) { build(:user) }

  it "Create a session (AKA login)" do
    
    user.save
    post '/login', params: { session: {email: 'j@gmail.com', password:'123456'}}
    expect(response.body).to include('/articles')
  end

  it "Shows login page" do 

    get '/login'
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Log in')
  end

  describe "Session Helper" do

    let(:user) { build(:user) }
    

    it 'Has a correct current user' do 
      user.save
      post '/login', params: {session: {email: user.email, password: user.password }}
      expect(controller.current_user.name).to eq(user.name)
    end
    
    it 'Has a User logged in?' do
      user.save
      post '/login', params: {session: {email: user.email, password: user.password }}
      expect(controller.logged_in?).to eq(true)
    end

    it 'Correct Log out' do
      user.save
      post '/login', params: {session: {email: user.email, password: user.password}}
      expect(controller.logged_in?).to eq(true)
      delete '/logout'
      expect(controller.current_user).to be_nil
    end
  end
end
