class App
  def call(env)
    [
      200,
      {},
      ['Hello, Ruby ', RUBY_VERSION.to_s, "\n"]
    ]
  end
end

run App.new
