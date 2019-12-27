module Outputs
  class UserType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :email, String, null: false
    field :name, String, null: true
    field :is_active, Boolean, null: false
    field :is_admin, Boolean, null: false
    field :password_digest, String, null: true

    def is_active
      @object.active?
    end

    def is_admin
      @object.admin?
    end

    def self.loads(id)
      User.find(id)
    end
  end
end
