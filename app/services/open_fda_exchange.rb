class OpenFdaExchange
    include HTTParty
    base_uri 'https://api.fda.gov'

    def self.get_drug_data(params)
        endpoint = '/drug/event.json'
        query_string = URI.encode_www_form(params)
        response = get("#{endpoint}?#{query_string}")
        response = JSON.parse(response.body)
        results = response["results"]
        return results
    end

    def self.get_device_data(params)
        endpoint = '/device/510k.json'
        query_string = URI.encode_www_form(params)
        response = get("#{endpoint}?#{query_string}")
        response = JSON.parse(response.body)
        results = response["results"]
        return results
    end

    def self.get_food_data(params)
        endpoint = '/food/enforcement.json'
        query_string = URI.encode_www_form(params)
        response = get("#{endpoint}?#{query_string}")
        response = JSON.parse(response.body)
        results = response["results"]
        return results
    end

    def self.get_animalandveterinary_data(params)
        endpoint = '/animalandveterinary/event.json'
        query_string = URI.encode_www_form(params)
        response = get("#{endpoint}?#{query_string}")
        response = JSON.parse(response.body)
        results = response["results"]
        return results
    end

    private

    def self.handle_response(response)
        case response.code
        when 200
            JSON.parse(response.body)
        when 400
            raise 'Bad Request: Invalid query'
        when 401
            raise 'Unauthorized: API key required'
        when 404
            raise 'Not Found: Resource not found'
        else
            raise "API Error: #{response.code}"
        end
    end
end