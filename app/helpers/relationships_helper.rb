module RelationshipsHelper
  def rel_activity(id)
    User.find(id)
  end
end
