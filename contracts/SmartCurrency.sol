pragma solidity ^0.4.4;

   
   contract SmartCurrency {
    mapping (address => uint256) balances;
    mapping (address => Usr ) Users;
   
    //users will be stored in address array.
   struct Usr {
    
    string [] details;
    
    }

   event Transfer(address indexed _from, address indexed _to, uint256 _value , string _bank_name, string _date); //transfer amount from to receiver
    
  function SmartCurrency() {
        balances[msg.sender]= 100000;
      
   }

   function SendCoins(address receiver,string bank_name, uint amount, string date)returns(bool sufficient) {
        if (balances[msg.sender] < amount) return false; // checks balance is not 0.
        balances[msg.sender] -= amount; // deducts  balance from Sender.
        balances[receiver] += amount; // increments  balance of  receiver.
        Users[msg.sender].details.push(bank_name);
        Users[msg.sender].details.push(date);
        Transfer(msg.sender, receiver, amount , bank_name, date); // event transfer gets called.
        return true;
    }
    
   function getBalance(address addr) returns(uint ) {
        return balances[addr]; // returns balance of reciever.
        
   }
    function updateStatus (string updateString) returns (bool updated) {
         Users[msg.sender].details.push(updateString);
         return true;
    }
    
    function getStatus(uint index) returns(string value ) {
     return Users[msg.sender].details[index];
     }
     
}