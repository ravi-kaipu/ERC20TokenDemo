// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <=0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DemoERC20Token is ERC20 {

    constructor () ERC20("DemoERC20 Token", "DemoERC20Token") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

}