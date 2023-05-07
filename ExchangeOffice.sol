pragma solidity ^0.8.0;

contract CurrencyExchange {
    mapping(address => uint) public tokenBalances;

    event TokensExchanged(address indexed sender, uint tokenAmount, uint etherAmount);

    function depositTokens(uint amount) external {
        // Assuming TokenA is an ERC20 token
        // Transfer TokenA from the sender to this contract
        // Remember to approve the contract to spend the tokens before calling this function
        // Example code: TokenA.transferFrom(msg.sender, address(this), amount);

        tokenBalances[msg.sender] += amount;
    }

    function exchangeTokensForEther(uint tokenAmount) external {
        require(tokenBalances[msg.sender] >= tokenAmount, "Insufficient token balance");

        // Calculate the corresponding Ether amount based on the exchange rate
        uint etherAmount = tokenAmount * 1 ether; // Assuming 1 TokenA = 1 Ether

        // Transfer the tokens from the sender to this contract
        // Example code: TokenA.transferFrom(msg.sender, address(this), tokenAmount);

        // Transfer the corresponding Ether to the sender
        payable(msg.sender).transfer(etherAmount);

        tokenBalances[msg.sender] -= tokenAmount;

        emit TokensExchanged(msg.sender, tokenAmount, etherAmount);
    }
}
