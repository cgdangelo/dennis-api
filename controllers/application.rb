class ApplicationController < Sinatra::Base
  class << self; def prefix(name); @@prefix = name.to_s.camelize; end; end

  helpers ApplicationHelpers

  before do
    establish_connection
  end

  after do
    close_connection
  end
end
