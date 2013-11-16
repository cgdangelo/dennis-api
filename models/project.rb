class Project
  include MongoMapper::Document

  key :title, String
  key :synopsis, String
  key :url, String
end
