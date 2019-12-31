class Note < ApplicationRecord
  belongs_to :noteable, polymorphic: true, optional: true

  belongs_to :user, foreign_key: "created_by_id"
  # need specs
end
