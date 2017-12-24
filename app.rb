require "yaml"
require 'sinatra/base'
require 'haml'

class Server < Sinatra::Base
  get ['/', "/passcode"] do
    haml :index
  end 

  passcodes = YAML.load_file("passcodes.yml")

  post "/passcode" do
    if passcodes.include?(params[:passcode])
      haml :comic
    else
      @error = "パスコードの値が無効です！"
      haml :index
    end
  end
end
