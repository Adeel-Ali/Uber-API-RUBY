# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/09/2016

module UberApi
  class UserProfile

    # First name of the Uber user.
    # @return [String]
    attr_accessor :first_name

    # Last name of the Uber user.
    # @return [String]
    attr_accessor :last_name

    # Email address of the Uber user
    # @return [String]
    attr_accessor :email

    # Image URL of the Uber user.
    # @return [String]
    attr_accessor :picture

    # Promo code of the Uber user.
    # @return [String]
    attr_accessor :promo_code

    def initialize(first_name = nil,
                   last_name = nil,
                   email = nil,
                   picture = nil,
                   promo_code = nil)
      @first_name = first_name
      @last_name = last_name
      @email = email
      @picture = picture
      @promo_code = promo_code

    end

    def method_missing(method_name)
      puts "There is no method called '#{method_name}'."
    end

    # Creates JSON of the curent object
    def to_json
      hash = key_map
      hash.to_json
    end

    # Creates an instance of the object from a hash
    def self.from_hash(hash)
      if hash == nil
        nil
      else
        # Extract variables from the hash
        first_name = hash["first_name"]
        last_name = hash["last_name"]
        email = hash["email"]
        picture = hash["picture"]
        promo_code = hash["promo_code"]
        # Create object from extracted values
        UserProfile.new(first_name,
                        last_name,
                        email,
                        picture,
                        promo_code)
      end
    end

    # Defines the key map for json serialization
    def key_map
      hash = {}
      hash['first_name'] = first_name
      hash['last_name'] = last_name
      hash['email'] = email
      hash['picture'] = picture
      hash['promo_code'] = promo_code
      hash
    end
  end
end
