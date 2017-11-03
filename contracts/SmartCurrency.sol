pragma solidity ^0.4.4;

    
    contract SmartCurrency {
    mapping (address => uint256) balances;
    mapping (address => string) bank;
    mapping (address => string) dates;
    mapping (address => string) statuses;
        
    //events invoked when the function is called
    // mapping ( address => Usr )  Users;

    // address[] details; //users will be stored in address array.
    
    
//     struct Usr {
//     address receiver;
//     string bank_name;
//     uint amount;
//     string date;
//     string status;
    
//   }
   event Transfer(address indexed _from, address indexed _to, uint256 _value); //transfer amount from to receiver 
    
   function SmartCurrency() {
        balances[tx.origin]= 100000;
        bank[tx.origin];
        dates[tx.origin];
        statuses[tx.origin];
    }

    // function updateStatus (address receiver,string bank_name,uint amount,string date,string status) returns (bool success) {
    //     address NewUser = msg.sender; //stores the new users details in address.
    //   //this lines checks that email exist or not.
    //     Users[NewUser].receiver = receiver; //users email gets stored in mapping user with the help of address NewUser.
    //     Users[NewUser].bank_name = bank_name;
    //     Users[NewUser].amount = amount;
    //     Users[NewUser].date = date;
    //     Users[NewUser].status = status;

    //     details.push(NewUser);  //stores in contract address.
    //     return true;
        
    //      }
         
    
      
    function SendCoins(address receiver,string bank_name, uint amount, string date, string status)returns(bool transferred) {
        if (balances[msg.sender] < amount) return false; // checks balance is not 0.
        balances[msg.sender] -= amount; // deducts  balance from Sender.
        balances[receiver] += amount; // increments  balance of  receiver.
        bank[receiver] = bank_name;
        dates[receiver] = date;
        statuses[receiver] = status;
        Transfer(msg.sender, receiver, amount); // event transfer gets called.
        return true;
    }
    
    function getBalance(address addr) returns(uint ) {
        return balances[addr]; // returns balance of reciever.
        
    }
     
     function getBank(address addr) returns(string ) {
         
         return bank[addr]; 
        
     }
     
     function getStatus(address addr) returns(string){
        return statuses[addr];
         
     }
     
}   

