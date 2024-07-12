# frozen_string_literal: true

require_relative '../../../chained_search_test'
require_relative '../../../generator/group_metadata'
require_relative '../../../helpers'

module AUCoreTestKit
  module AUCoreV050_CI_BUILD
    class ImmunizationPatient_IHI_ChainSearchTest < Inferno::Test
      include AUCoreTestKit::ChainedSearchTest

      title '(SHOULD) Server returns valid results for Immunization search by patient (IHI) (chained parameters)'
      description %(A server SHOULD support searching by
patient:Patient.identifier (IHI) on the Immunization resource. This test
will pass if the server returns a success response to the request.

[AU Core Server CapabilityStatement](http://hl7.org.au/fhir/core//CapabilityStatement-au-core-server.html)
)

      id :au_core_v050_ci_build_immunization_patient_ihi_chain_search_test

      optional

      input :patient_ids,
            title: 'Patient IDs',
            description: 'Comma separated list of patient IDs that in sum contain all MUST SUPPORT elements',
            default: 'baratz-toni, irvine-ronny-lawrence, italia-sofia, howe-deangelo, hayes-arianne, baby-banks-john, banks-mia-leanne'

      def self.properties
        @properties ||= SearchTestProperties.new(
          resource_type: 'Immunization',
          search_param_names: ['patient:Patient.identifier'],
          attr_paths: ['patient'],
          target_identifier: { display: 'IHI', url: 'http://ns.electronichealth.net.au/id/hi/ihi/1.0' }
        )
      end

      def self.metadata
        @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml'), aliases: true))
      end

      def scratch_resources
        scratch[:immunization_resources] ||= {}
      end

      run do
        run_chain_search_test
      end
    end
  end
end
