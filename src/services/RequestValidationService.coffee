assert = require 'assert'

module.exports = class RequestValidationService

  validatePayRequest: (request) ->
    # mandatory params only validation
    assert request
    @validateMerchant request.merchant
    @validateUser request.user
    @validatePaymentAccount request.payment_account
    @validateOrder request.order
    @validatePurchase request.purchase
    @validateSignature request

  validateMerchant: (merchant) ->
    assert merchant
    assert merchant.id
    assert merchant.key

  validateUser: (user) ->
    assert user
    assert user.merchant_user_id
    @validateEmail user.email

  validateEmail: (email) ->
    assert email

  validatePaymentAccount: (account) ->
    assert account
    assert account.type

  validateOrder: (order) ->
    assert order
    assert order.id
    assert order.description
    @validateAmount order.amount

  validateAmount: (amount) ->
    assert amount
    assert amount.value
    assert amount.currency

  validatePurchase: (purchase) ->
    assert purchase
    assert purchase.ip_address

  validateSignature: (request) ->
    assert request
    assert request.signature