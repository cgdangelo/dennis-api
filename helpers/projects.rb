helpers do
  def bson_object_id val
    BSON::ObjectId.from_string val
  end

  def document_by_id id
    id = bson_object_id(id) if String === id
    $projects.find_one(:_id => id)
  end
end
