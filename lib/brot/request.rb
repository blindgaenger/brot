module Brot
  class Request

    def initialize(protonet, json)
      @protonet = protonet
      @json = json
    end

    def protonet
      @protonet
    end

    def user
      @user ||= @protonet.find_user(@json['user_id'])
    end

    def channel
      @channel ||= @protonet.find_channel(@json['channel_id'])
    end

    def author
      @json['author']
    end

    def message
      @json['message']
    end

    #--

    def answer(*args)
      channel.speak(*args)
    end

  end
end