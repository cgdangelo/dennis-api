class ApplicationController < Sinatra::Base
  helpers ApplicationHelpers

  before do
    establish_connection
  end

  after do
    close_connection
  end
end
