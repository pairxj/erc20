pragma solidity ^0.4.24;

import "./PausableToken.sol";

/**
 * @title DCoinFax Token
 */
contract DCoinFaxToken is PausableToken {
    string public constant name = "DCoinFax Token";
    string public constant symbol = "DFXT";
    uint8 public constant decimals = 18;
    uint256 public totalSupply = 50 * 10000 * 10000 * (10 ** uint256(decimals));

    /**
     * Constructor function
     *
     * Initializes contract with initial supply tokens to the initialTokenOwner
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
