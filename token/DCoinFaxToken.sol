pragma solidity ^0.4.24;

import "./PausableToken.sol";

contract DCoinFaxToken is PausableToken {
    // Public variables of the token
    string public constant name = "DCoinFax Token";
    string public constant symbol = "DFXT";
    uint8 public constant decimals = 18;
    uint256 public constant initialSupply = 5000000000;
    // 18 decimals is the strongly suggested default, avoid changing it
    uint256 public totalSupply = initialSupply * 10 ** uint256(decimals);

    /**
     * Constructor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    constructor (
        address initialTokenOwner
    ) public {
        balances[initialTokenOwner] = totalSupply;             // Give the initialTokenOwner all initial tokens
        emit Transfer(0x0, initialTokenOwner, totalSupply);
    }

    /**
     * Allows the current owner to transfer control of the contract to a newOwner.
     * @param newOwner The address to transfer ownership to.
     */
    function transferOwnership(address newOwner) onlyOwner whenNotPaused public {
        super.transferOwnership(newOwner);
    }
}
