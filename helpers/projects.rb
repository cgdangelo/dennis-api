module ProjectsHelpers
  def bson_object_id val
    BSON::ObjectId.from_string val
  end
end
