
module Multipluck
  module Pluck
    extend ActiveSupport::Concern

    included do
    # Preserve the original pluck functionality
      alias_method :single_column_pluck, :pluck

      def pluck(column_name_or_array)
        return single_column_pluck(column_name_or_array) unless  column_name_or_array.instance_of?(Array)

        column_names = column_name_or_array.map(&:to_s)

        # Array of rows
        rows = klass.connection.select_all(select(column_names).arel)

        # Row is a hash of of 'column_name' => value
        rows.map! do |row|
          attrs = klass.initialize_attributes(row)
          column_names.map do |col_name|
            klass.type_cast_attribute(col_name, attrs)
          end
        end
      end

    end
  end
end

ActiveRecord::Calculations.send(:include, Multipluck::Pluck)
