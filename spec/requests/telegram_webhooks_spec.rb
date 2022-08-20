# spec/requests/telegram_webhooks_spec.rb
require 'telegram/bot/rspec/integration/rails'

RSpec.describe TelegramWebhooksController, telegram_bot: :rails do

  it 'shows usage of basic matchers' do
    expect { dispatch_command(:start) }.to make_telegram_request(bot, :sendMessage).
      with(hash_including(text: 'msg text'))

    # There are some shortcuts for dispatching basic updates and testing responses.
    expect { dispatch_message('Hi') }.to send_telegram_message(bot, /msg regexp/, some: :option)
  end

  describe '#start!' do
    subject { -> { dispatch_command :start } }
    # Using built in matcher for `respond_to`:
    it { should respond_with_message 'Hi there!' }
  end

  describe '#hey_callback_query', :callback_query do
    let(:data) { "hey:#{name}" }
    let(:name) { 'Joe' }
    it { should answer_callback_query('Hey Joe') }
    it { should edit_current_message :text, text: 'Done' }
  end
end