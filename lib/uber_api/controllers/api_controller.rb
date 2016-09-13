# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).

module UberApi
  class APIController < BaseController
    @@instance = APIController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # The Promotions endpoint returns information about the promotion that will be available to a new user based on their activity's location. These promotions do not apply for existing users.
    # @param [Float] end_latitude Required parameter: Latitude component of end location.
    # @param [Float] end_longitude Required parameter: Longitude component of end location.
    # @param [Float] start_latitude Required parameter: Latitude component of start location.
    # @param [Float] start_longitude Required parameter: Longitude component of start location
    # @return PromotionsResponse response from the API call
    def get_promotions(options = Hash.new)

      # Validate required parameters
      if options['end_latitude'] == nil
        raise ArgumentError.new "Required parameter 'end_latitude' cannot be nil."
      elsif options['end_longitude'] == nil
        raise ArgumentError.new "Required parameter 'end_longitude' cannot be nil."
      elsif options['start_latitude'] == nil
        raise ArgumentError.new "Required parameter 'start_latitude' cannot be nil."
      elsif options['start_longitude'] == nil
        raise ArgumentError.new "Required parameter 'start_longitude' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/promotions'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'end_latitude' => options['end_latitude'],
        'end_longitude' => options['end_longitude'],
        'start_latitude' => options['start_latitude'],
        'start_longitude' => options['start_longitude']
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types, such as ?Unacceptable content type. Request resource as: application/json.', _context
      elsif _response.status_code == 409
        raise APIException.new '409 - A conflict needs to be resolved before the request can be made.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content or there are issues with a rider\'s user account.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error.', _context
      elsif _response.status_code == 222
        raise APIException.new '222 - bac', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return PromotionsResponse.from_hash(decoded)
    end

    # The Request endpoint allows a ride to be requested on behalf of an Uber user given their desired product, start, and end locations. Please review the Sandbox documentation on how to develop and test against these endpoints without making real-world Requests and being charged.
    # @param [RequestBody] body Required parameter: Example: 
    # @return Request response from the API call
    def create_request(body)

      # Validate required parameters
      if body == nil
        raise ArgumentError.new "Required parameter 'body' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/requests'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'content-type' => 'application/json; charset=utf-8',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.post _query_url, headers: _headers, parameters: body.to_json
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types, such as ?Unacceptable content type. Request resource as: application/json', _context
      elsif _response.status_code == 409
        raise APIException.new '409 - A conflict needs to be resolved before the request can be made.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content or there are issues with a rider\'s user account.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return Request.from_hash(decoded)
    end

    # Cancel an ongoing Request on behalf of a rider.
    # @param [String] request_id Required parameter: Unique identifier representing a Request.
    # @return void response from the API call
    def delete_request_cancel(request_id)

      # Validate required parameters
      if request_id == nil
        raise ArgumentError.new "Required parameter 'request_id' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/requests/{request_id}'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'request_id' => request_id
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.delete _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types, such as ?Unacceptable content type. Request resource as: application/json.', _context
      elsif _response.status_code == 409
        raise APIException.new '409 - A conflict needs to be resolved before the request can be made', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content or there are issues with a rider\'s user account.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)
    end

    # Get a map with a visual representation of a Request.
    # @param [String] request_id Required parameter: Unique identifier representing a Request.
    # @return RequestMapResponse response from the API call
    def get_request_map(request_id)

      # Validate required parameters
      if request_id == nil
        raise ArgumentError.new "Required parameter 'request_id' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/requests/{request_id}/map'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'request_id' => request_id
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types, such as ?Unacceptable content type. Request resource as: application/json.', _context
      elsif _response.status_code == 409
        raise APIException.new '409 - A conflict needs to be resolved before the request can be made.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content or there are issues with a rider\'s user account.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return RequestMapResponse.from_hash(decoded)
    end

    # The Price Estimates endpoint returns an estimated price range for each product offered at a given location. The price estimate is provided as a formatted string with the full price range and the localized currency symbol.
    # @param [Float] end_latitude Required parameter: Latitude component of end location.
    # @param [Float] end_longitude Required parameter: Longitude component of end location.
    # @param [Float] start_latitude Required parameter: Latitude component of start location.
    # @param [Float] start_longitude Required parameter: Longitude component of start location.
    # @return PriceEstimateCollection response from the API call
    def get_price_estimates(options = Hash.new)

      # Validate required parameters
      if options['end_latitude'] == nil
        raise ArgumentError.new "Required parameter 'end_latitude' cannot be nil."
      elsif options['end_longitude'] == nil
        raise ArgumentError.new "Required parameter 'end_longitude' cannot be nil."
      elsif options['start_latitude'] == nil
        raise ArgumentError.new "Required parameter 'start_latitude' cannot be nil."
      elsif options['start_longitude'] == nil
        raise ArgumentError.new "Required parameter 'start_longitude' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/estimates/price'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'end_latitude' => options['end_latitude'],
        'end_longitude' => options['end_longitude'],
        'start_latitude' => options['start_latitude'],
        'start_longitude' => options['start_longitude']
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types: ?Unacceptable content type. Request resource as: application/json, etc.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return PriceEstimateCollection.from_hash(decoded)
    end

    # The Time Estimates endpoint returns ETAs for all products offered at a given location, with the responses expressed as integers in seconds. We recommend that this endpoint be called every minute to provide the most accurate, up-to-date ETAs.
    # @param [Float] start_latitude Required parameter: Latitude component of the start location
    # @param [Float] start_longitude Required parameter: Longitude component of the start location
    # @param [String] customer_uuid Optional parameter: The customer id interested in estimate
    # @param [String] product_id Optional parameter: Id of the requested product
    # @return TimeEstimateCollection response from the API call
    def get_time_estimates(options = Hash.new)

      # Validate required parameters
      if options['start_latitude'] == nil
        raise ArgumentError.new "Required parameter 'start_latitude' cannot be nil."
      elsif options['start_longitude'] == nil
        raise ArgumentError.new "Required parameter 'start_longitude' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/estimates/time'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'start_latitude' => options['start_latitude'],
        'start_longitude' => options['start_longitude'],
        'customer_uuid' => options['customer_uuid'],
        'product_id' => options['product_id']
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types: ?Unacceptable content type. Request resource as: application/json, etc.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return TimeEstimateCollection.from_hash(decoded)
    end

    # The User Activity endpoint returns data about a user's lifetime activity with Uber. The response will include pickup locations and times, dropoff locations and times, the distance of past requests, and information about which products were requested.
    # @param [Integer] limit Required parameter: Number of items to return for pagging
    # @param [Integer] offset Required parameter: Page offset for pagging
    # @return UserActivity response from the API call
    def get_user_activity_v_1_1(options = Hash.new)

      # Validate required parameters
      if options['limit'] == nil
        raise ArgumentError.new "Required parameter 'limit' cannot be nil."
      elsif options['offset'] == nil
        raise ArgumentError.new "Required parameter 'offset' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1.1/history'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'limit' => options['limit'],
        'offset' => options['offset']
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types: ?Unacceptable content type. Request resource as: application/json, etc.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return UserActivity.from_hash(decoded)
    end

    # Get product details w.r.t id
    # @param [String] product_id Required parameter: Unique identifier representing a specific product for a given latitude & longitude. For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles.
    # @return Product response from the API call
    def get_product_detail_by_id(product_id)

      # Validate required parameters
      if product_id == nil
        raise ArgumentError.new "Required parameter 'product_id' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/products/{product_id}'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'product_id' => product_id
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return Product.from_hash(decoded)
    end

    # Get the real time status of an ongoing trip that was created using the Ride Request endpoint.
    # @param [String] request_id Required parameter: Example: 
    # @return RequestDetailsCollections response from the API call
    def get_request_details(request_id)

      # Validate required parameters
      if request_id == nil
        raise ArgumentError.new "Required parameter 'request_id' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/requests/{request_id}'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_template_parameters _query_builder, {
        'request_id' => request_id
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types, such as ?Unacceptable content type. Request resource as: application/json.', _context
      elsif _response.status_code == 409
        raise APIException.new '409 - A conflict needs to be resolved before the request can be made.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content or there are issues with a rider\'s user account.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return RequestDetailsCollections.from_hash(decoded)
    end

    # The Products endpoint returns information about the Uber products offered at a given location. The response includes the display name and other details about each product, and lists the products in the proper display order.
    # @param [Float] latitude Required parameter: Latitude component of location.
    # @param [Float] longitude Required parameter: Longitude component of location.
    # @return ProductCollection response from the API call
    def get_products_types(options = Hash.new)

      # Validate required parameters
      if options['latitude'] == nil
        raise ArgumentError.new "Required parameter 'latitude' cannot be nil."
      elsif options['longitude'] == nil
        raise ArgumentError.new "Required parameter 'longitude' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/products'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'latitude' => options['latitude'],
        'longitude' => options['longitude']
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types: ?Unacceptable content type. Request resource as: application/json, etc.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return ProductCollection.from_hash(decoded)
    end

    # The User Profile endpoint returns information about the Uber user that has authorized with the application.
    # @return UserProfile response from the API call
    def get_user_profile
      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/v1/me'

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json',
        'Authorization' => 'Bearer %s' % (Configuration.o_auth_access_token)
      }

      # Create the HttpRequest object for the call
      _request = @http_client.get _query_url, headers: _headers
      
      # Call the on_before_request callback
      @http_call_back.on_before_request(_request) if @http_call_back

      # Invoke the API call and get the response
      _response = @http_client.execute_as_string(_request)

      # Wrap the request and response in an HttpContext object
      _context = HttpContext.new(_request, _response)

      # Call the on_after_response callback
      @http_call_back.on_after_response(_context) if @http_call_back

      # Endpoint error handling using HTTP status codes.
      if _response.status_code == 404
        return nil
      elsif _response.status_code == 400
        raise APIException.new '400 - Malformed request.', _context
      elsif _response.status_code == 401
        raise APIException.new '401 - Unauthorized the request requires user authentication (not logged in).', _context
      elsif _response.status_code == 403
        raise APIException.new '403 - Forbidden. Also used for unauthorized requests such as improper OAuth 2.0 scopes or permissions issues.', _context
      elsif _response.status_code == 406
        raise APIException.new '406 - Unacceptable content type. Client sent an accepts header for a content type which does not exist on the server. Body includes a list of acceptable content types: ?Unacceptable content type. Request resource as: application/json, etc.', _context
      elsif _response.status_code == 422
        raise APIException.new '422 - Invalid request. The request body is parse-able however with invalid content.', _context
      elsif _response.status_code == 429
        raise APIException.new '429 - Too Many Requests. Rate limited.', _context
      elsif _response.status_code == 500
        raise APIException.new '500 - Internal Server Error.', _context
      end

      # Global error handling using HTTP status codes.
      validate_response(_context)

      # Return appropriate response type
      decoded = APIHelper.json_deserialize(_response.raw_body)
      return UserProfile.from_hash(decoded)
    end
  end
end
