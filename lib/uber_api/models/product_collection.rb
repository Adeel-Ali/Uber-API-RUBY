# This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ) on 05/09/2016

module UberApi
  class ProductCollection

    # List of products
    # @return [List of Product]
    attr_accessor :products

    def initialize(products = nil)
      @products = products

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
        # Parameter is an array, so we need to iterate through it
        products = nil
        if hash["products"] != nil
          products = Array.new
          hash["products"].each{|structure| products << Product.from_hash(structure)}
        end
        # Create object from extracted values
        ProductCollection.new(products)
      end
    end

    # Defines the key map for json serialization
    def key_map
      hash = {}
      hash['products'] = products.map(&:key_map)
      hash
    end
  end
end
