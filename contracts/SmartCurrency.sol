pragma solidity ^0.4.4;

    
    contract SmartCurrency {
    mapping (address => uint256) balances;
        
    //events invoked when the function is called

   event Transfer(address indexed _from, address indexed _to, uint256 _value); //transfer amount from to receiver 
    
   function SmartCurrency() {
        balances[tx.origin]= 100000;
    
    }

    function Resetbalance() returns (uint balance) {
        if(balances[msg.sender]<1) {
        balance=balances[msg.sender]+=1000;
        return balance;
        }
        
    } 
       
    function SendCoins(address receiver,uint amount)returns(bool sufficient) {
        if (balances[msg.sender] < amount) return false; // checks balance is not 0.
        balances[msg.sender] -= amount; // deducts  balance from Sender.
        balances[receiver] += amount; // increments  balance of  receiver.
        Transfer(msg.sender, receiver, amount); // event transfer gets called.
        return true;
    }
    
    function getBalance(address addr) returns(uint) {
        return balances[addr]; // returns balance of reciever.
       
   }
     
}   

