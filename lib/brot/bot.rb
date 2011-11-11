module Brot

  class Bot
    TRIGGER_MESSAGE = 'meep.receive'

    def initialize(protonet, plugins)
      @protonet = protonet
      @user = @protonet.current_user
      @salutation = /^\s*@#{@protonet.current_user.login}\b/i
      @plugins = plugins.map{|name| name.to_sym}
    end

    def listen
      puts "bot starts to listen ..."
      @protonet.socket do |json|
        next if json['user_id'] == @user.id
        next unless json['trigger'] == TRIGGER_MESSAGE
        next unless json['message'] =~ @salutation

        request = Request.new(@protonet, json)
        @plugins.each do |plugin|
          if self.respond_to? plugin
            self.send(plugin, request)
          end
        end
      end
    end

    # TODO: move plugins to files

    def ping(request)
      if request.message =~ /PING$/i
        request.answer 'PONG'
      end
    end

    def echo(request)
      if md = request.message.match(/ECHO (.*)$/i)
        request.answer md[1]
      end
    end

    def time(request)
      if request.message =~ /(TIME|ZEIT)$/i
        request.answer "Server time is: #{Time.now}"
      end
    end

    def hello(request)
      if request.message =~ /HELLO$/i
        request.answer "Hi, #{request.author}!"
      end
    end

  end
end
