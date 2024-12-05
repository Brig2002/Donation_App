## How I wrote and deployed my Donation Dapp 
- I then wrote my  license and my pragma version.
- I then wrote my contract.
- First, I wrote my first contract Donation.sol which is my main contract .
- In this main contract I implemented Funding(I use mapping to keep track of donations, address[] to store donors,fund() function to accept ETH donations,
  and emit a DonationReceived event for every donation).
- I then create a PriceConverter.sol whoch helps to convert the ETH to USD.
- I also wrote a function call withdraw() to allow withdrawal of funds.
- I then restricted access by introducing a function call onlyOwner.
- For transparency,I emit a FundWithdraw function..
- I then compiled and deployed the contract on the Sepolia testnet.




## The challenges I faced
- I didn't faces any challenges this time.
  
## Deployed Addresses

Donation_Contract_Adress = 0x045dF369044eb3Ac07c31Bc995Af9B02486C829B

PriceConverter_Contract_Address = 0xE49Fd581299c311689914fCaBfd111B017D136FB
