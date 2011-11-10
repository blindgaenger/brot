module Brot
  class Bot

    def initialize(protonet)
      @protonet = protonet
    end

    def listen
      puts 'brot starting to listen ...'
      @protonet.socket do |json|
        next unless json['trigger'] == 'meep.receive'
        puts json.inspect
      end
    end

  end
end
