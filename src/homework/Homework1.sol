// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Create a struct called Vegetable and give it the properties of name, color, and countryOfOrigin. Create a mapping to store these Vegetables by using a continuous counter. Then, create a public function that will allow anyone to add a Vegetable to the mapping. 

// Bonus: create a modifier that uses an enum to track whether the function is accepting updates or not

contract Homework1 {
    // Define your struct here
    struct Vegetable {
        string name;
        string color;
        string countryOfOrigin;
    }

    // Define your mapping here
    mapping(uint256 => Vegetable) public vegetables;

    // Define your enum here (please make sure the states are called "Accepting" and "NotAccepting"))
    enum UpdateStatus { Accepting, NotAccepting }

    // set the enum to the default "Accepting" value
    UpdateStatus public currentStatus = UpdateStatus.Accepting;

    // define a vegetable counter here (perhaps a uint of sorts?)
    uint256 public vegetableCounter;
    
    // Define your modifier here: the modifier will check if the state is Accepting
    modifier isAccepting() {
        require(currentStatus == UpdateStatus.Accepting, "Updates are currently not accepting.");
        _;
    }

    // Function to toggle the current status between Accepting and NotAccepting
    function toggleUpdateStatus() public {
        if (currentStatus == UpdateStatus.Accepting) {
            currentStatus = UpdateStatus.NotAccepting;
        } else {
            currentStatus = UpdateStatus.Accepting;
        }
    }

    // Define your function here: the function will add a Vegetable to the mapping
    function addVegetable(string memory _name, string memory _color, string memory _countryOfOrigin) public isAccepting {
        vegetableCounter++; // Increment the vegetable counter
        vegetables[vegetableCounter] = Vegetable(_name, _color, _countryOfOrigin); // Add the new vegetable to the mapping
    }

    // This function is used as a hint and to retrieve the Vegetable from the mapping
    function getVegetable(uint8 index) public view returns (Vegetable memory) {
        return vegetables[index];
    }
}