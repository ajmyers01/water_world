require 'rubygems'
require 'bundler'
Bundler.require
require 'faye'

class ServerAuth
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message['ext']['auth_token'] != 'secret'
        message['error'] = 'Invalid authentication token'
      end
    end
    callback.call(message)
  end

  def outgoing(message, callback)
    if message['ext'] && mesage['ext']['auth_token']
      message['ext'] = {}
    end
    callback.call(message)
  end
end

Faye::WebSocket.load_adapter('thin')
faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)
faye_server.add_extension(ServerAuth.new)
run faye_server
