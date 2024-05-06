# frozen_string_literal: true

module Rack
  class Attack
    # OFFICE_IP_ADDRESS = ENV['ALLOW_IP'] # IPアドレス

    # blocklist('only allow from office') do |req|
    #   req.path.match(%r{^/admin}) && (req.ip != OFFICE_IP_ADDRESS)
    # end
  end
end
