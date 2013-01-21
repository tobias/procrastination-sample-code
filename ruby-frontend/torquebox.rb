TorqueBox.configure do
#  queue "/queue/sync"
 # queue "/queue/async"

  queue "/queue/results" do
    processor ResultsListener
  end
  
end
