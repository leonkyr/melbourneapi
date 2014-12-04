EventService = require '../../src/services/eventService'
expect = require 'expect'
should = require 'should'
assert = require 'assert'

describe 'Event Service', ->
  describe 'Pay Request Related Events', ->

    it 'pay-request-received', ->
      api = new EventService()

      api.event {
        type: 'pay-request-received',
        parameters: {
          merchant_id: 'test-merchant-01'
        }
      }, () ->
        noop # we don't need to do anything

    it 'pay-processed', ->
      api = new EventService()

      api.event {
        type: 'pay-processed',
        parameters: {
          merchant_id: 'test-merchant-01'
        }
      }, () ->
        noop # we don't need to do anything