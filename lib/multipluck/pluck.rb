module Multipluck
  module Pluck
    extend ActiveSupport::Concern

    included do
      # Preserve the original `pluck` functionality
      alias_method :single_column_pluck, :pluck

      def pluck(*args)
        # Extract `opts` (defaults could be merged here in the future)
        opts = args.last.is_a?(Hash) ? args.pop : {}

        # Maintains legacy support, the previous interface expected an `Array`
        # as the first argument
        column_names = args.flatten

        # If no `opts` is empty and there was only one `column_name` specified
        # fall back to the default `pluck` implementation
        return single_column_pluck(column_names.first) \
          if column_names.size == 1 && opts.empty?

        # Since `column_names` can be symbols `stringify` them here
        column_names.map!(&:to_s)

        # Yields an `Array` of `Hash(es)`
        rows = klass.connection.select_all(select(column_names).arel)

        # Row is a `Hash` of: 'column_name' => value
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
