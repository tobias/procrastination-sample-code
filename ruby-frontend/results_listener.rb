require 'torquebox-messaging'
require 'torquebox-cache'

class ResultsListener < TorqueBox::Messaging::MessageProcessor
  def on_message(m)
    cache = TorqueBox::Infinispan::Cache.new
    results = cache.get('results')
    results ||= []
    results << m
    results.shift if results.size > 5
    cache.put('results', results)
  end
  
end
