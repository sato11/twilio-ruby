##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Studio
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Studio < StudioBase
            class V2 < Version
                class FlowContext < InstanceContext

                     class FlowRevisionList < ListResource
                    ##
                    # Initialize the FlowRevisionList
                    # @param [Version] version Version that contains the resource
                    # @return [FlowRevisionList] FlowRevisionList
                    def initialize(version, sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { sid: sid }
                        @uri = "/Flows/#{@solution[:sid]}/Revisions"
                        
                    end
                
                    ##
                    # Lists FlowRevisionInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields FlowRevisionInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of FlowRevisionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of FlowRevisionInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })

                        response = @version.page('GET', @uri, params: params)

                        FlowRevisionPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of FlowRevisionInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of FlowRevisionInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    FlowRevisionPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Studio.V2.FlowRevisionList>'
                    end
                end


                class FlowRevisionContext < InstanceContext
                    ##
                    # Initialize the FlowRevisionContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the Flow resource to fetch.
                    # @param [String] revision Specific Revision number or can be `LatestPublished` and `LatestRevision`.
                    # @return [FlowRevisionContext] FlowRevisionContext
                    def initialize(version, sid, revision)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid, revision: revision,  }
                        @uri = "/Flows/#{@solution[:sid]}/Revisions/#{@solution[:revision]}"

                        
                    end
                    ##
                    # Fetch the FlowRevisionInstance
                    # @return [FlowRevisionInstance] Fetched FlowRevisionInstance
                    def fetch

                        payload = @version.fetch('GET', @uri)
                        FlowRevisionInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                            revision: @solution[:revision],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Studio.V2.FlowRevisionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Studio.V2.FlowRevisionContext #{context}>"
                    end
                end

                class FlowRevisionPage < Page
                    ##
                    # Initialize the FlowRevisionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [FlowRevisionPage] FlowRevisionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of FlowRevisionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [FlowRevisionInstance] FlowRevisionInstance
                    def get_instance(payload)
                        FlowRevisionInstance.new(@version, payload, sid: @solution[:sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Studio.V2.FlowRevisionPage>'
                    end
                end
                class FlowRevisionInstance < InstanceResource
                    ##
                    # Initialize the FlowRevisionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this FlowRevision
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [FlowRevisionInstance] FlowRevisionInstance
                    def initialize(version, payload , sid: nil, revision: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'friendly_name' => payload['friendly_name'],
                            'definition' => payload['definition'],
                            'status' => payload['status'],
                            'revision' => payload['revision'] == nil ? payload['revision'] : payload['revision'].to_i,
                            'commit_message' => payload['commit_message'],
                            'valid' => payload['valid'],
                            'errors' => payload['errors'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  ,'revision' => revision  || @properties['revision']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [FlowRevisionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = FlowRevisionContext.new(@version , @params['sid'], @params['revision'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Flow resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Flow resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the Flow.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Hash] JSON representation of flow definition.
                    def definition
                        @properties['definition']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The latest revision number of the Flow's definition.
                    def revision
                        @properties['revision']
                    end
                    
                    ##
                    # @return [String] Description of change made in the revision.
                    def commit_message
                        @properties['commit_message']
                    end
                    
                    ##
                    # @return [Boolean] Boolean if the flow definition is valid.
                    def valid
                        @properties['valid']
                    end
                    
                    ##
                    # @return [Array<Hash>] List of error in the flow definition.
                    def errors
                        @properties['errors']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the FlowRevisionInstance
                    # @return [FlowRevisionInstance] Fetched FlowRevisionInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Studio.V2.FlowRevisionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Studio.V2.FlowRevisionInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


