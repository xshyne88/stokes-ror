module Resolvers
  class Error < GraphQL::Function
    type types[Types::ErrorType]
    description "Validation error"

    def call(obj, _args, _ctx)
      map_errors(obj[:errors])
    end

    private

    def map_errors(errors)
      case errors
      when ActiveModel::Errors, Hash
        errors.map { |field, message| {field: field.to_s.camelize(:lower), message: message} }
      else
        errors.map { |error| {field: :base, message: error} }
      end
    end
  end
end
