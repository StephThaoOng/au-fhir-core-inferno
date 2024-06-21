# frozen_string_literal: true

require_relative '../../../read_test'

module AUCoreTestKit
  module AUCoreV050_CI_BUILD
    class BodyheightReadTest < Inferno::Test
      include AUCoreTestKit::ReadTest

      title '(SHALL) Server returns correct Observation resource from Observation read interaction'
      description 'A server SHALL support the Observation read interaction.'

      id :au_core_v050_ci_build_bodyheight_read_test

      def resource_type
        'Observation'
      end

      def scratch_resources
        scratch[:bodyheight_resources] ||= {}
      end

      run do
        perform_read_test(all_scratch_resources)
      end
    end
  end
end
