# frozen_string_literal: true

require_relative '../../../search_test'
require_relative '../../../generator/group_metadata'
require_relative '../../../helpers'

module AUCoreTestKit
  module AUCoreV030_BALLOT
    class LocationProvenanceRevincludeSearchTest < Inferno::Test
      include AUCoreTestKit::SearchTest

      title '(SHALL) Server returns Provenance resources from Location search by address + revInclude:Provenance:target'
      description %(
        A server SHALL be capable of supporting _revIncludes:Provenance:target.

        This test will perform a search by address + revInclude:Provenance:target and
        will pass if a Provenance resource is found in the response.
      %)

      id :au_core_v030_ballot_location_provenance_revinclude_search_test

      def properties
        @properties ||= SearchTestProperties.new(
          resource_type: 'Location',
          search_param_names: ['address']
        )
      end

      def self.metadata
        @metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, 'metadata.yml')))
      end

      def self.provenance_metadata
        @provenance_metadata ||= Generator::GroupMetadata.new(YAML.load_file(File.join(__dir__, '..', 'provenance', 'metadata.yml'), aliases: true))
      end

      def scratch_resources
        scratch[:location_resources] ||= {}
      end

      def scratch_provenance_resources
        scratch[:provenance_resources] ||= {}
      end

      run do
        run_provenance_revinclude_search_test
      end
    end
  end
end
