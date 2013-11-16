class ApplicationController < Sinatra::Base
  helpers ApplicationHelpers

  before do
    establish_connection
  end

  after do
    close_connection
  end

  def parse_json_data
    request.body.rewind
    JSON.parse request.body.read
  end
end
