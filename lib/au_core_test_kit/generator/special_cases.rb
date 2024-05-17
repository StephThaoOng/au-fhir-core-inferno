# frozen_string_literal: true

module AUCoreTestKit
  class Generator
    module SpecialCases
      RESOURCES_TO_EXCLUDE = %w[
        Medication
        RelatedPerson
      ].freeze

      PROFILES_TO_EXCLUDE = [].freeze

      PATIENT_IDENTIFIERS = [
        { display: 'IHI', url: 'http://ns.electronichealth.net.au/id/hi/ihi/1.0' },
        { display: 'Medicare', url: 'http://ns.electronichealth.net.au/id/medicare-number' },
        { display: 'DVA', url: 'http://ns.electronichealth.net.au/id/dva' }
      ].freeze

      PRACTITIONER_IDENTIFIERS = [
        { display: 'HPI-I', url: 'http://ns.electronichealth.net.au/id/hi/hpii/1.0' }
      ].freeze

      class << self
        def exclude_group?(group)
          RESOURCES_TO_EXCLUDE.include?(group.resource)
        end

        def patient_au_identifiers
          PATIENT_IDENTIFIERS
        end

        def practitioner_au_identifiers
          PRACTITIONER_IDENTIFIERS
        end
      end
    end
  end
end
