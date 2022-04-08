// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;


contract TicketManager{

    enum classes {
        FIRST,
        BUSINESS,
        ECONOMY
    }
    struct User { 
        string name;
        string destination;
        uint passport_id;
        classes class;
    }
    // address[] public allUsersAddress;
    mapping(address => User) public users;
    mapping(address => bool) public whitelisted_Users;



    address payable public owner;
    uint public economy_price;
    uint public business_price;
    uint public first_price;
    uint public factor;

    modifier onlyOwner() {
        require(msg.sender == owner, "ONly Owner Can Call" );
        _;
    }

    modifier onlyUsers() {
        require(whitelisted_Users[msg.sender], "Only Existing User Can Call" );
        _;
    }

    constructor(address payable _owner, uint _economy_price, uint _business_price, uint _first_price, uint _factor) public {
        owner = _owner;
        economy_price= _economy_price;
        business_price= _business_price;
        first_price= _first_price;
        factor = _factor;
    }

    function _addUser() onlyOwner public {
        // allUsersAddress.push(msg.sender);
        whitelisted_Users[msg.sender] = true;
        // tickets[msg.sender] = allUsersAddress.length-1;
    }

    function _removeUser(address addr) onlyUsers public {
        // uint id = tickets[addr];
        // delete allUsersAddress[id];
        whitelisted_Users[addr] = false;
    }


    function createTicket(string memory name, string memory destination, uint ID, classes class) public returns(bool){
        require(class == classes.FIRST || class == classes.BUSINESS || class == classes.ECONOMY, "Invalid Class Information");
        User memory user = User(name, destination, ID, class);
        users[msg.sender] = user;
        _addUser();
        return true;
    }  

    function _getBalance() public view returns(uint){
        // check balance of the contract
        return address(this).balance;
    }

    function receivePayment(string memory name, string memory destination, uint ID, classes class) onlyOwner payable public{
        // transfer balance to the owner
        bool ticketCreated = createTicket(name, destination, ID, class);
        if (ticketCreated == true){
            uint price = 0;
            if (class == classes.BUSINESS){
                price = business_price;
            }
            else if (class == classes.ECONOMY){
                price = economy_price;
            }
            else if (class == classes.FIRST){
                price = first_price;
            }

            require(_getBalance() >= (price/factor), "Not Enough Balance");
            owner.transfer(price / factor);
        }
    }

    
}

contract AirlineTicketManager{
    TicketManager public airlineticketManager;

    address payable public owner;
    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner Can Call" );
        _;
    }

    constructor(){
        owner = payable(msg.sender);
    }

    function createAirlineTicketManager(address payable _owner, uint _economy_price, uint _business_price, uint _first_price, uint _factor) public onlyOwner{
        airlineticketManager = new TicketManager(_owner, 5, 7, 10, 1000);
    }
}

