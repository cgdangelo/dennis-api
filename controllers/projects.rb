class ProjectsController < Sinatra::Base
  include Mongo

  configure do
    $mongo_client = MongoClient.new
    $dennis       = $mongo_client.db 'dennis'
    $projects     = $dennis['projects']
  end

  get '/' do
    $projects.find.to_a.to_json
  end

  get '/:oid' do
    document_by_id(params[:oid]).to_json
  end

  post '/' do
    request.body.rewind
    request_json = JSON.parse request.body.read

    project_id = $projects.insert({ :name => request_json['name'], :synopsis => request_json['synopsis'], :repo => request_json['repo'] })
    project_id.to_json
  end

  delete '/:oid' do
    $projects.remove '_id' => bson_object_id(params[:oid])
    true
  end

  put '/:oid' do
    request.body.rewind
    request_json = JSON.parse request.body.read
    request_json.delete '_id'

    $projects.update({'_id' => bson_object_id(params[:oid])}, request_json)
    true
  end
end