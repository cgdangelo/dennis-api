require 'bundler'
Bundler.require :default
Dir.glob('./{controllers,helpers}/*.rb').each { |file| require file }

map('/api/projects') { run ProjectsController }
