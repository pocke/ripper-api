require 'ripper'
require 'json'

class App
  def call(env)
    input = env['rack.input'].read.force_encoding(Encoding::UTF_8)
    [
      200,
      {},
      [response_body(input)]
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
