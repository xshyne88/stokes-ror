module Outputs
  class NoteType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :body, String, null: false
    field :created_by, Outputs::UserType, null: false

    def created_by
      Loaders::AssociationLoader.for(Note, :created_by).load(@object)
    end

    def self.loads(id)
      Note.find(id)
    end
  end
end
