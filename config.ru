require 'bundler'
Bundler.require
Dir.glob('./{helpers,models,controllers}/*.rb').each { |file| require file }

map('/api/projects') { run ProjectsController }
map('/') { run ApplicationController }
