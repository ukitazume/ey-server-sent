class ChatController < ApplicationController
  include ActionController::Live

  def index
  end

  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    response.headers['X-Accel-Buffering'] = 'no'
    100000000.times {
      response.stream.write "data: hello world #{Time.zone.now}\n" + "\r\n\n"
      sleep 1
    }
    render nothing: true
  ensure
    response.stream.close
  end
end
