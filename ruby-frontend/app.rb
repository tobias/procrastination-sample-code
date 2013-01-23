require 'sinatra'
require 'benchmark'
require 'haml'

require 'http'
require 'messaging'
require 'async'

helpers do
  
  def benchmark
    @time = Benchmark.realtime { yield }
  end
  
end
