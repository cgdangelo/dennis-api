class ProjectsController < ApplicationController
  helpers ProjectsHelpers

  get '/' do
    Project.all.to_json
  end

  get '/:id' do
    Project.find(params[:id]).to_json
  end

  post '/' do
    json = parse_json_data
    new_project = Project.new json

    if new_project.save
      new_project.to_json
    else
      false
    end
  end

  delete '/:id' do
    Project.find(params[:id]).delete
  end

  put '/:id' do
    json = parse_json_data
    Project.update(params[:id], json).to_json
  end
end
