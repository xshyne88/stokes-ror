module Outputs
  class VerifiedCompletedDutyType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :user, Outputs::UserType, null: false
    field :extension, Integer, null: false
    field :completed_duty, Outputs::CompletedDutyType, null: false

    def user
      Loaders::AssociationLoader.for(VerifiedCompletedDuty, :user).load(@object)
    end

    # this needs to be fixed loader may be bugged
    def completed_duty
      Loaders::AssociationLoader.for(VerifiedCompletedDuty, :completed_duty).load(@object)
    end

    def self.loads(id)
      VerifiedCompletedDuty.find(id)
    end
  end
end
