require 'torquebox-messaging'
require 'torquebox-cache'

get '/a' do
  if data = extract_data_param
    benchmark do
      TorqueBox::Messaging::Queue.new("/queue/async").
        publish(data, :encoding => :edn)
      @recent_results = TorqueBox::Infinispan::Cache.new.get('results')
    end
  end

  haml :async_index
end
