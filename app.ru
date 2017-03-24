require 'ripper'
require 'json'

class App
  def call(env)
    p env
    [
      200,
      {},
      [response_body(env['rack.input'].read)]
    ]
  end

  def response_body(code)
    sexp = Ripper.sexp(code)
    resp = {
      body: sexp,
      meta: {
        RUBY_VERSION: RUBY_VERSION
      }
    }
    JSON.dump(resp)
  end
end

run App.new
