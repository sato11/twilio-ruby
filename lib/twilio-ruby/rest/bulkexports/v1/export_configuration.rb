##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Bulkexports
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Bulkexports < BulkexportsBase
            class V1 < Version
                class ExportConfigurationList < ListResource
                    ##
                    # Initialize the ExportConfigurationList
                    # @param [Version] version Version that contains the resource
                    # @return [ExportConfigurationList] ExportConfigurationList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Bulkexports.V1.ExportConfigurationList>'
                    end
                end


                class ExportConfigurationContext < InstanceContext
                    ##
                    # Initialize the ExportConfigurationContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] resource_type The type of communication – Messages, Calls, Conferences, and Participants
                    # @return [ExportConfigurationContext] ExportConfigurationContext
                    def initialize(version, resource_type)
                        super(version)

                        # Path Solution
                        @solution = { resource_type: resource_type,  }
                        @uri = "/Exports/#{@solution[:resource_type]}/Configuration"

                        
                    end
                    ##
                    # Fetch the ExportConfigurationInstance
                    # @return [ExportConfigurationInstance] Fetched ExportConfigurationInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        ExportConfigurationInstance.new(
                            @version,
                            payload,
                            resource_type: @solution[:resource_type],
                        )
                    end

                    ##
                    # Update the ExportConfigurationInstance
                    # @param [Boolean] enabled If true, Twilio will automatically generate every day's file when the day is over.
                    # @param [String] webhook_url Stores the URL destination for the method specified in webhook_method.
                    # @param [String] webhook_method Sets whether Twilio should call a webhook URL when the automatic generation is complete, using GET or POST. The actual destination is set in the webhook_url
                    # @return [ExportConfigurationInstance] Updated ExportConfigurationInstance
                    def update(
                        enabled: :unset, 
                        webhook_url: :unset, 
                        webhook_method: :unset
                    )

                        data = Twilio::Values.of({
                            'Enabled' => enabled,
                            'WebhookUrl' => webhook_url,
                            'WebhookMethod' => webhook_method,
                        })

                        payload = @version.update('POST', @uri, data: data)
                        ExportConfigurationInstance.new(
                            @version,
                            payload,
                            resource_type: @solution[:resource_type],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Bulkexports.V1.ExportConfigurationContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Bulkexports.V1.ExportConfigurationContext #{context}>"
                    end
                end

                class ExportConfigurationPage < Page
                    ##
                    # Initialize the ExportConfigurationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ExportConfigurationPage] ExportConfigurationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ExportConfigurationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ExportConfigurationInstance] ExportConfigurationInstance
                    def get_instance(payload)
                        ExportConfigurationInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Bulkexports.V1.ExportConfigurationPage>'
                    end
                end
                class ExportConfigurationInstance < InstanceResource
                    ##
                    # Initialize the ExportConfigurationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this ExportConfiguration
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ExportConfigurationInstance] ExportConfigurationInstance
                    def initialize(version, payload , resource_type: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'enabled' => payload['enabled'],
                            'webhook_url' => payload['webhook_url'],
                            'webhook_method' => payload['webhook_method'],
                            'resource_type' => payload['resource_type'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'resource_type' => resource_type  || @properties['resource_type']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ExportConfigurationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ExportConfigurationContext.new(@version , @params['resource_type'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [Boolean] If true, Twilio will automatically generate every day's file when the day is over.
                    def enabled
                        @properties['enabled']
                    end
                    
                    ##
                    # @return [String] Stores the URL destination for the method specified in webhook_method.
                    def webhook_url
                        @properties['webhook_url']
                    end
                    
                    ##
                    # @return [String] Sets whether Twilio should call a webhook URL when the automatic generation is complete, using GET or POST. The actual destination is set in the webhook_url
                    def webhook_method
                        @properties['webhook_method']
                    end
                    
                    ##
                    # @return [String] The type of communication – Messages, Calls, Conferences, and Participants
                    def resource_type
                        @properties['resource_type']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the ExportConfigurationInstance
                    # @return [ExportConfigurationInstance] Fetched ExportConfigurationInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ExportConfigurationInstance
                    # @param [Boolean] enabled If true, Twilio will automatically generate every day's file when the day is over.
                    # @param [String] webhook_url Stores the URL destination for the method specified in webhook_method.
                    # @param [String] webhook_method Sets whether Twilio should call a webhook URL when the automatic generation is complete, using GET or POST. The actual destination is set in the webhook_url
                    # @return [ExportConfigurationInstance] Updated ExportConfigurationInstance
                    def update(
                        enabled: :unset, 
                        webhook_url: :unset, 
                        webhook_method: :unset
                    )

                        context.update(
                            enabled: enabled, 
                            webhook_url: webhook_url, 
                            webhook_method: webhook_method, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Bulkexports.V1.ExportConfigurationInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Bulkexports.V1.ExportConfigurationInstance #{values}>"
                    end
                end

            end
        end
    end
end
