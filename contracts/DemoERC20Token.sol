// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <=0.8.0;

contract DemoERC20Token {

    string public name;
    string public symbol;
    uint256 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowances;

    event Transfer(address indexed _from, address indexed _to, uint256 value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);


    constructor (string memory _name, string memory _symbol, uint256 _initialSupply)
    public {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    function transfer(address _recipient, uint256 _amount) public returns (bool success) {
        require(balances[msg.sender] >= _amount, "Insufficient funds");
        require(_recipient != address(0), "Invalid recipient addess");

        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;

        emit Transfer(msg.sender, _recipient, _amount);
        return true;
    }

    function transferFrom(address _from, address _recipient, uint256 _amount) public returns (bool success) {
        require(_from != address(0), "Invalid from addess");
        require(_recipient != address(0), "Invalid recipient addess");
        require(balances[_from] >= _amount, "Insufficient funds");
        require(allowances[_from][msg.sender] >= _amount, "ERC20: transfer amount exceeds allowance");

        balances[_from] -= _amount;
        balances[_recipient] += _amount;
        
        allowances[_from][msg.sender] -= _amount;

        emit Transfer(_from, _recipient, _amount);
        return true;
    }

    function approve(address _spender, uint256 _amount) public returns (bool success) {
        require(_spender != address(0), "ERC20: approve to the zero address");
        
        allowances[msg.sender][_spender] = _amount;
        
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

}