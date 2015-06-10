require File.join(File.dirname(__FILE__), '..', 'app.rb')
require "rack/test"

def app
  LaMaretaEmails
end

describe 'App Service' do
  include Rack::Test::Methods

  it "loads homepage" do
    get '/'

    expect(last_response).to be_ok
  end
end
