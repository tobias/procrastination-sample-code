require 'rest-client'
require 'edn'

get '/h' do
  if data = params["data"]
    benchmark do
      @result =
        EDN.read(RestClient.get('http://localhost:8080/backend',
                                {:params => {:data => data.to_edn}}).to_str)
    end
  end

  haml :http_index
end
