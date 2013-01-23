require 'torquebox-messaging'
require 'torquebox-cache'

class ResultsListener < TorqueBox::Messaging::MessageProcessor
  def on_message(m)
    cache = TorqueBox::Infinispan::Cache.new(:name => 'haminize-cache')
    results = cache.get('results') || []
    results << m
    cache.put('results', results)
  end
  
end
