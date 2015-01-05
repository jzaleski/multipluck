module Multipluck
  module Pluck
    extend ActiveSupport::Concern

    included do
      # Preserve the original `pluck` functionality
      alias_method :single_column_pluck, :pluck

      def pluck(*column_names)
        # Yields an `Array` of `String` column-names (maintains legacy support,
        # the previous interface expected an `Array` as the first argument)
        column_names = Array(column_names.flatten).map(&:to_s)

        # If there was only one `column_name` specified fall back to the default
        # `pluck` implementation
        return single_column_pluck(column_names.first) if column_names.size == 1

        # Fetch and map rows (yields an `Array` of `Array(s)`)
        klass.connection.select_all(select(column_names).arel).map! do |row|
          attributes = klass.initialize_attributes(row)
          column_names.map do |column_name|
            klass.type_cast_attribute(column_name, attributes)
          end
        end
      end
    end
  end
end

ActiveRecord::Calculations.send(:include, Multipluck::Pluck)
