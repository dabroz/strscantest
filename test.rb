ENV['BOOTSNAP_CACHE_DIR'] = './tmp/'

require 'bundler/setup'
require 'bootsnap/setup'
require 'rails'

Bundler.require(*Rails.groups)

require 'rspec'

describe 'Foo', type: :request do
  it 'foo' do
    expect(1+1).to eq 2
  end
end
