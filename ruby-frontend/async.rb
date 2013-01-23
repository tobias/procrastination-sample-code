require 'torquebox-messaging'
require 'torquebox-cache'

get '/a' do
  if data = params["data"]
    benchmark do
      TorqueBox::Messaging::Queue.new("/queue/async").
        publish(data, :encoding => :edn)
      
      @recent_results =
        TorqueBox::Infinispan::Cache.new(:name => 'haminize-cache').
          get('results')
    end
  end

  haml :async_index
end
