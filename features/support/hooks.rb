# frozen_string_literal: true

require 'httpclient'
require File.expand_path("../tester_sets.rb", __FILE__)

Before do
  @http_client = HTTPClient.new
  tester_sets.each do |_, tester_set|
    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    res = @http_client.delete(apiroot + "sites")
    if (res.code / 100).to_i != 2 then
      fail(StandardError.new("Cannot delete sites (site:#{_}, code:#{res.code})"))
    end
  end
end

After do
  tester_sets.each do |_, tester_set|
    apiroot = "http://" + tester_set[:ip_address] + ":3000/"
    res = @http_client.delete(apiroot + "sites")
    if (res.code / 100).to_i != 2 then
      fail(StandardError.new("Cannot delete sites (site:#{_}, code:#{res.code})"))
    end
  end
end
