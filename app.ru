class App
  def call(env)
    [
      200,
      {},
      ['Hello']
    ]
  end
end

run App.new
