# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).

module UberApi
  class UberAPIClient
    # Singleton access to client controller
    # @return [APIController] Returns the controller instance
    def client
      APIController.instance
    end

    # Initializer with authentication and configuration parameters
    def initialize(o_auth_access_token: nil)
      Configuration.o_auth_access_token = o_auth_access_token
    end
  end
end
