class ChatgptService
  include HTTParty
  
  attr_reader :api_url, :options, :model, :message
  
  def initialize(message)
    api_key = ENV.fetch("GPT_KEY", nil)
    @options = {
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Bearer #{api_key}"
      }
    }
    @api_url = 'https://api.openai.com/v1/chat/completions'
    @model = "gpt-3.5-turbo"
    @message = message
  end
  
  def call
    body = {
      model:,
      messages: [{ role: 'user', content: message }]
    }
    response = HTTParty.post(api_url, body: body.to_json, headers: options[:headers], timeout: 60)
    raise response['error']['message'] unless response.code == 200

    response['choices'][0]['message']['content']
  end
  
  class << self
    def call(message)
      new(message).call
    end
  end
end