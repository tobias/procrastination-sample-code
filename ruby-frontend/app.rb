require 'sinatra'
require 'benchmark'
require 'haml'

require 'http'
require 'messaging'
require 'async'

helpers do
  def extract_data_param
    @original_data = params["data"]
    @original_data.split(',').map(&:strip).inject({}) do |h, t|
      k, v = t.split(':')
      h[k] = v
      h
    end if @original_data
  end

  def benchmark
    @time = Benchmark.realtime { yield }
  end
end
