require_relative '../../../search_test'
require_relative '../../../generator/group_metadata'

module AUCoreTestKit
  module AUCoreV030_BALLOT
    class DiagnosticresultPatientCodeSearchTest < Inferno::Test
      include AUCoreTestKit::SearchTest

      title 'Server returns valid results for Observation search by patient + code'
      description %(
A server SHALL support searching by
patient + code on the Observation resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[AU Core Server CapabilityStatement](http://hl7.org.au/fhir/core/0.3.0-ballot/CapabilityStatement-au-core-server.html)

      )

      id :au_core_v030_ballot_diagnosticresult_patient_code_search_test
      input :patient_ids,
        title: 'Patient IDs',
        description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements',
        default: 'bennelong-anne, smith-emma, baby-smith-john, dan-harry, italia-sofia, wang-li'
  
      def self.properties
        @properties ||= SearchTestProperties.new(
          resource_type: 'Observation',
        search_param_names: ['patient', 'code'],
        possible_status_search: true,
        token_search_params: ['code']
        )
      end

      def self.metadata
        @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml'), aliases: true))
      end

      def scratch_resources
        scratch[:diagnosticresult_resources] ||= {}
      end

      run do
        run_search_test
      end
    end
  end
end
