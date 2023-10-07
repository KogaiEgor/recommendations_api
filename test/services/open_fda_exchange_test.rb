require 'test_helper'
require 'webmock'

class OpenFdaExchangeTest < ActiveSupport::TestCase
  test 'test OpenFdaExchange.get_drug_data getting data from the external API' do
    query = { search: 'receivedate:[20040101 TO 20081231]', limit: 1 }

    WebMock.allow_net_connect!

    response = OpenFdaExchange.get_drug_data(query)
    assert_not_empty response
  end

  test 'test OpenFdaExchange.get_device_data getting data from the external API' do
    params = { count: 'country_code' }

    WebMock.allow_net_connect!

    response = OpenFdaExchange.get_device_data(params)
    assert_not_empty response
  end

  test 'test OpenFdaExchange.get_food_data getting data from the external API' do
    query = { search: 'classification:"Class+III"', limit: 1 } 

    WebMock.allow_net_connect!

    response = OpenFdaExchange.get_food_data(query)
    assert_not_empty response
  end

  test 'test OpenFdaExchange.get_animalandveterinary_data getting data from the external API' do
    query = { search: 'original_receive_date:[20040101 TO 20161107]', limit: 1 }

    WebMock.allow_net_connect!

    response = OpenFdaExchange.get_animalandveterinary_data(query)
    assert_not_empty response
  end
end
