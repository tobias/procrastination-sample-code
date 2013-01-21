require 'torquebox-messaging'

get '/m' do
  if data = extract_data_param
    benchmark do
      @result =
        TorqueBox::Messaging::Queue.new("/queue/sync").
          publish_and_receive(data, :encoding => :edn)
    end
  end

  haml :messaging_index
end
