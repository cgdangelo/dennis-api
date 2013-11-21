class ApplicationObjectController < ApplicationController
  class_attribute :prefix

  def self.rest(name)
    self.prefix = name.to_s.camelize

    get '/' do
      Object::const_get(self.prefix.to_s.camelize).all.to_json
    end

    get '/:id' do
      Object::const_get(self.prefix.to_s.camelize).find(params[:id]).to_json
    end

    post '/' do
      json = parse_json_data
      new_object = Object::const_get(self.prefix.to_s.camelize).new json

      if new_object.save
        new_object.to_json
      else
        false
      end
    end

    delete '/:id' do
      Object::const_get(self.prefix.to_s.camelize).find(params[:id]).delete
    end

    put '/:id' do
      json = parse_json_data
      Object::const_get(self.prefix.to_s.camelize).update(params[:id], json).to_json
    end
  end
end
