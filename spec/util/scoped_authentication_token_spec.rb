require 'spec_helper'

describe Twilio::Util::ScopedAuthenticationToken do

  it 'should generate a token for no grants' do
    scat = Twilio::Util::ScopedAuthenticationToken.new 'SK123', 'AC123'
    token = scat.encode 'secret'
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['nbf']).not_to be_nil
    expect(payload['exp']).not_to be_nil
    expect(payload['nbf'] + 3600).to eq(payload['exp'])
    expect(payload['jti']).not_to be_nil
    expect("#{payload['iss']}-#{payload['nbf']}").to eq(payload['jti'])
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(0)
  end

  it 'should be able to add standard grants' do
    scat = Twilio::Util::ScopedAuthenticationToken.new 'SK123', 'AC123'
    scat.add_grant 'https://api.twilio.com/**'
    token = scat.encode 'secret'
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['nbf']).not_to be_nil
    expect(payload['exp']).not_to be_nil
    expect(payload['nbf'] + 3600).to eq(payload['exp'])
    expect(payload['jti']).not_to be_nil
    expect("#{payload['iss']}-#{payload['nbf']}").to eq(payload['jti'])
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(1)
    expect(payload['grants'][0]['res']).to eq('https://api.twilio.com/**')
    expect(payload['grants'][0]['act']).to eq(['*'])
  end

  it 'should be able to add endpoint grants' do
    scat = Twilio::Util::ScopedAuthenticationToken.new 'SK123', 'AC123'
    scat.add_endpoint_grant 'bob'
    token = scat.encode 'secret'
    expect(token).not_to be_nil
    payload, header = JWT.decode token, 'secret'

    expect(payload['iss']).to eq('SK123')
    expect(payload['sub']).to eq('AC123')
    expect(payload['nbf']).not_to be_nil
    expect(payload['exp']).not_to be_nil
    expect(payload['nbf'] + 3600).to eq(payload['exp'])
    expect(payload['jti']).not_to be_nil
    expect("#{payload['iss']}-#{payload['nbf']}").to eq(payload['jti'])
    expect(payload['grants']).not_to be_nil
    expect(payload['grants'].count).to eq(1)
    expect(payload['grants'][0]['res']).to eq('sip:bob@AC123.endpoint.twilio.com')
    expect(payload['grants'][0]['act']).to eq([Twilio::Util::Action::Client::LISTEN, Twilio::Util::Action::Client::INVITE])
  end
end
