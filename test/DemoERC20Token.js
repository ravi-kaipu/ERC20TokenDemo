const { assert } = require("console");
var DemoERC20Token = artifacts.require('./DemoERC20Token.sol');

contract('DemoERC20Token', function(accounts) {
    var tokenInstance;
    var assert = require('assert');


    it('sets the total supply upon deployment', function() {
        return DemoERC20Token.deployed().then(function (instance) {
            tokenInstance = instance;
            return tokenInstance.totalSupply()
        }).then(function(totalSupply) {
            assert.equal(totalSupply.toNumber(), 1000000000000000, "totalSupply should be 1000000000000000");
        });
    })

    it('initialize the contract with the correct values', function() {
        return DemoERC20Token.deployed().then(function (instance) {
            tokenInstance = instance;
            return tokenInstance.name()
        }).then(function(name) {
            assert.equal(name, 'DemoERC20 Token');
        });
    })

    it('transfer tokens', function() {
        return DemoERC20Token.deployed().then(function (instance) {
            tokenInstance = instance;
            return tokenInstance.transfer.call(accounts[1], 1000, {from : accounts[0]});
        }).then(function(success) {
            assert.equal(success, true, 'transfer is failed');
        });
    })

    it('approves tokens for recipient transfer', function() {
        return DemoERC20Token.deployed().then(function(instance) {
            tokenInstance = instance;
            return tokenInstance.approve.call(accounts[1], 100);
        }).then(function(success) {
            assert.equal(success, true, 'it should return true');
            return tokenInstance.approve(accounts[1], 100, { from : accounts[0] });
        }).then(function(receipt) {
            assert.equal(receipt.logs.length, 1, 'trigger one event');
            assert.equal(receipt.logs[0].event, 'Approval', 'should be the "Approval" event.');
        });
    })
})