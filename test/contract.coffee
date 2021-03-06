MelbourneAPI = require '../src/MelbourneAPI'
expect = require 'expect'
should = require 'should'
assert = require 'assert'

describe 'Melbourne API Core', ->
  describe 'Simplest Pay call', ->

    it 'Initial Payment Request with all new objects', ->
      api = new MelbourneAPI()

      api.pay {
        merchant: {
          id: 'test-merchant-01',
          key: '123123123123',
        },
        user: {
          merchant_user_id: '0001-0001-0001-0001',
          email: 'test@test.com',
        },
        payment_account: {
          type: 'card',
          tokenize: true,
          parameters: [
            { name: 'number', value: '4111111111111111' },
            { name: 'holder_name', value: 'John Down' },
            { name: 'expiry_month', value: '10' },
            { name: 'expiry_year', value: '2019' },
            { name: 'cvc', value: '123' },
          ],
        },
        order: {
          id: 'order-0001',
          amount: {
            value: 12345,
            currency: 'EUR',
          },
          description: 'Purchase from ENAY.COM'
        },
        purchase: {
          ip_address: '1.1.1.1',
        },
        signature: 'md5hash-of-some-important-parameters'
      }, (error, result) ->
          assert result
          assert result.status
          result.status.should.equal 'accepted'

    it 'Repeat purchase', ->
      api = new MelbourneAPI()

      api.pay {
        merchant: {
          id: 'test-merchant-01',
          key: '123123123123',
        },
        user: {
          merchant_user_id: '0001-0001-0001-0001',
          email: 'test@test.com',
        },
        payment_account: {
          type: 'card',
          token: '12312312312312312',
        },
        order: {
          id: 'order-0002',
          amount: {
            value: 12345,
            currency: 'EUR',
          },
          description: 'Purchase from ABAZON.COM'
        },
        purchase: {
          ip_address: '1.1.1.1',
        },
        signature: 'md5hash-of-some-important-parameters'
      }, (error, result) ->
        assert result
        assert result.status
        result.status.should.equal 'accepted'