module Brot

  class Bot
    TRIGGER_MESSAGE = 'meep.receive'

    def initialize(protonet, config)
      @protonet = protonet
      @name = config['name']
      @user = @protonet.current_user
      @channel = @protonet.find_channel(config['channel_id'])
    end

    def listen
      puts "#{@name} starts to listen on channel #{@channel.name} ..."
      @protonet.socket do |json|
        next if json['user_id'] == @user.id
        next unless json['channel_id'] == @channel.id
        next unless json['trigger'] == TRIGGER_MESSAGE

        author = json['author']
        message = json['message']

        @channel.speak("#{author} said: #{message}")
      end
    end

  end
end
