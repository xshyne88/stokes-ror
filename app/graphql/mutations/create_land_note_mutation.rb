module Mutations
  class CreateLandNoteMutation < Types::BaseMutation
    description "Create a LandNote"

    argument :land_id, ID, required: true, loads: Outputs::LandType
    argument :body, String, required: true

    field :land, Outputs::LandType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      land_note = Note.new(noteable: input.land, body: input.body, created_by: current_user)

      if land_note.save
        {land: input.land.reload, errors: []}
      else
        {land: nil, errors: land_note.errors}
      end
    end
  end
end
