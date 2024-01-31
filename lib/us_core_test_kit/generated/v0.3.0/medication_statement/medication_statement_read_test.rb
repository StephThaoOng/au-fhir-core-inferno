require_relative '../../../read_test'

module USCoreTestKit
  module USCoreV030
    class MedicationStatementReadTest < Inferno::Test
      include USCoreTestKit::ReadTest

      title 'Server returns correct MedicationStatement resource from MedicationStatement read interaction'
      description 'A server SHALL support the MedicationStatement read interaction.'

      id :us_core_v030_medication_statement_read_test

      def resource_type
        'MedicationStatement'
      end

      def scratch_resources
        scratch[:medication_statement_resources] ||= {}
      end

      run do
        perform_read_test(all_scratch_resources)
      end
    end
  end
end
