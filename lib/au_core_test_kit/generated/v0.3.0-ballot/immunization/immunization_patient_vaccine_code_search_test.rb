require_relative '../../../search_test'
require_relative '../../../generator/group_metadata'

module AUCoreTestKit
  module AUCoreV030_BALLOT
    class ImmunizationPatientVaccineCodeSearchTest < Inferno::Test
      include AUCoreTestKit::SearchTest

      title 'Server returns valid results for Immunization search by patient + vaccine-code'
      description %(
A server MAY support searching by
patient + vaccine-code on the Immunization resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[AU Core Server CapabilityStatement](http://hl7.org/fhir/us/core//CapabilityStatement-us-core-server.html)

      )

      id :au_core_v030_ballot_immunization_patient_vaccine_code_search_test
      optional
  
      input :patient_ids,
        title: 'Patient IDs',
        description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements',
        default: 'bennelong-anne, smith-emma, baby-smith-john, dan-harry, italia-sofia, wang-li'
  
      def self.properties
        @properties ||= SearchTestProperties.new(
          resource_type: 'Immunization',
        search_param_names: ['patient', 'vaccine-code'],
        possible_status_search: true,
        token_search_params: ['vaccine-code']
        )
      end

      def self.metadata
        @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml'), aliases: true))
      end

      def scratch_resources
        scratch[:immunization_resources] ||= {}
      end

      run do
        run_search_test
      end
    end
  end
end
