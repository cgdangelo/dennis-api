class ApplicationObjectController < ApplicationController
  get '/' do
    Object::const_get(@@prefix).all.to_json
  end

  get '/:id' do
    Object::const_get(@@prefix).find(params[:id]).to_json
  end

  post '/' do
    json = parse_json_data
    new_object = Object::const_get(@@prefix).new json

    if new_object.save
      new_object.to_json
    else
      false
    end
  end

  delete '/:id' do
    Object::const_get(@@prefix).find(params[:id]).delete
  end

  put '/:id' do
    json = parse_json_data
    Object::const_get(@@prefix).update(params[:id], json).to_json
  end
end
