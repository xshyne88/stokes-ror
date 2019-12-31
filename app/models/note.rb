class Note < ApplicationRecord
  belongs_to :noteable, polymorphic: true, optional: true

  belongs_to :created_by, class_name: 'User', foreign_key: "created_by_id"
  # need specs
end
