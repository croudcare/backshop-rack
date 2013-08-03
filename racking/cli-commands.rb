
$ irb -rrack

  Rack::Handler.constants
  => [:CGI, :FastCGI, :Mongrel, :EventedMongrel, :SwiftipliedMongrel, :WEBrick, :LSWS, :SCGI, :Thin]
 
  # 1
  app = lambda {|env| [200, {"Content-Type" => "text/plain" } , ["Be welcome"]  ]}
  Rack::Handler::Mongrel.run app, :Port => 3000
  # Go to your browser and point to http://localhost:3000
  # BAMN

--

  # 2
  Rack::Handler::WEBrick.run app, :Port => 3000
  # Go to your browser and point to http://localhost:3000
  # BAMN

--   
  # 3

  class Backshop
    def call(env)
      [200, {"Content-Type" => "text/plain" } , ["Be welcome"] ]
    end
  end
  
  Rack::Handler::Mongrel.run Backshop.new, :Port => 3000
  # Go to your browser and point to http://localhost:3000
  # BAMN

-- 
  # Add thin to your Gemfile
  # bundle install
  # 4
  class Backshop
    def call(env)
      [200, {"Content-Type" => "text/plain" } , ["Be welcome Thin"] ]
    end
  end

  Rack::Handler::Thin.run Backshop.new, :Port => 3000
  # Go to your browser and point to http://localhost:3000
  # BAMN
--
  # 5
  class Backshop
    def call(env)
      [200, {"Content-Type" => "text/plain" } , ["Be welcome Thin"] ]
    end
  end

  Rack::Handler::Thin.run Backshop.new.method(:call), :Port => 3000










