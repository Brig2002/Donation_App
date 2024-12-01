// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./PriceConverter.sol";

contract Donation {
     using PriceConverter for uint256;

    address public owner; // Store the owner of the contract
    uint256 public constant MINIMUM_USD = 50 * 1e18; // $50 in USD
    

    event DonationReceived(address indexed donor, uint256 amount);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    // Track donations by address
    mapping(address => uint256) public donations;
    address[] public funders; // Keep a list of all donors

    constructor() {
        owner = msg.sender; // Set the deployer as the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can withdraw funds");
        _;
    }

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "Minimum donation is $50"
        );
        donations[msg.sender] += msg.value; // Track the donation amount
        funders.push(msg.sender); // Add the sender to the funders list
        emit DonationReceived(msg.sender, msg.value); // Log the donation
    }

    function withdraw() public onlyOwner {
        uint256 contractBalance = address(this).balance;
        require(contractBalance > 0, "No funds to withdraw");

        // Transfer all funds to the owner
        (bool success, ) = owner.call{value: contractBalance}("");
        require(success, "Withdrawal failed");

        emit FundsWithdrawn(owner, contractBalance); // Log the withdrawal
    }

    receive() external payable {
    emit DonationReceived(msg.sender, msg.value);
}

}
