##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class Permissions < Version
        class VoicePermissionList < ListResource
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class BulkCountryUpdateList < ListResource
            ##
            # Initialize the BulkCountryUpdateList
            # @param [Version] version Version that contains the resource
            # @return [BulkCountryUpdateList] BulkCountryUpdateList
            def initialize(version)
              super(version)

              # Path Solution
              @solution = {}
              @uri = "/VoicePermissions/BulkCountryUpdates"
            end

            ##
            # Retrieve a single page of BulkCountryUpdateInstance records from the API.
            # Request is executed immediately.
            # @param [String] update_request Json list of update objects. eg : [ { "iso_code":
            #   "GB", "low_risk_numbers": "Enabled", "high_risk_special_numbers":"Enabled",
            #   "high_risk_irsf_numbers": "Enabled" } ]
            # @return [BulkCountryUpdateInstance] Newly created BulkCountryUpdateInstance
            def create(update_request: nil)
              data = Twilio::Values.of({'UpdateRequest' => update_request, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              BulkCountryUpdateInstance.new(@version, payload, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Permissions.BulkCountryUpdateList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class BulkCountryUpdatePage < Page
            ##
            # Initialize the BulkCountryUpdatePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [BulkCountryUpdatePage] BulkCountryUpdatePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of BulkCountryUpdateInstance
            # @param [Hash] payload Payload response from the API
            # @return [BulkCountryUpdateInstance] BulkCountryUpdateInstance
            def get_instance(payload)
              BulkCountryUpdateInstance.new(@version, payload, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Permissions.BulkCountryUpdatePage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class BulkCountryUpdateInstance < InstanceResource
            ##
            # Initialize the BulkCountryUpdateInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @return [BulkCountryUpdateInstance] BulkCountryUpdateInstance
            def initialize(version, payload)
              super(version)

              # Marshaled Properties
              @properties = {
                  'update_count' => payload['update_count'].to_i,
                  'update_request' => payload['update_request'],
              }
            end

            ##
            # @return [String] The number of countries successfully updated
            def update_count
              @properties['update_count']
            end

            ##
            # @return [String] The update_request
            def update_request
              @properties['update_request']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Preview.Permissions.BulkCountryUpdateInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Preview.Permissions.BulkCountryUpdateInstance>"
            end
          end
        end
      end
    end
  end
end