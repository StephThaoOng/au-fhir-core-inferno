# frozen_string_literal: true

require_relative '../../../search_test'
require_relative '../../../generator/group_metadata'
require_relative '../../../helpers'

module AUCoreTestKit
  module AUCoreV030_BALLOT
    class PatientPatient_gender_identityMultipleAndSearchTest < Inferno::Test
      include AUCoreTestKit::SearchTest

      title '(MAY) Server returns valid results for Patient multipleAnd search by patient-gender-identity'
      description %(A server MAY support searching by multipleAnd
patient-gender-identity on the Patient resource. This test
will pass if resources are returned and match the search criteria. If
none are returned, the test is skipped.

[AU Core Server CapabilityStatement](http://hl7.org.au/fhir/core/0.3.0-ballot/CapabilityStatement-au-core-server.html)
)

      id :au_core_v030_ballot_patient_patient_gender_identity_multiple_and_search_test

      optional

      input :patient_ids,
            title: 'Patient IDs',
            description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements',
            default: 'baratz-toni, irvine-ronny-lawrence, italia-sofia, howe-deangelo, hayes-arianne, baby-banks-john, banks-mia-leanne'

      def self.properties
        @properties ||= SearchTestProperties.new(resource_type: 'Patient',
                                                 search_param_names: ['patient-gender-identity'])
      end

      def self.metadata
        @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml'), aliases: true))
      end

      def scratch_resources
        scratch[:patient_resources] ||= {}
      end

      run do
        perform_multiple_and_search_test
      end
    end
  end
end
