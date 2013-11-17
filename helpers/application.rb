module ApplicationHelpers
  def establish_connection
    MongoMapper.connection = Mongo::Connection.new
    MongoMapper.database = 'dennis'
  end

  def close_connection
    MongoMapper.connection.close
  end

  def parse_json_data
    request.body.rewind
    JSON.parse request.body.read
  end
end
