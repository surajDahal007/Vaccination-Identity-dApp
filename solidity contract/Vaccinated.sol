//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Vaccinated{

    struct registers{
        string name;
        uint8 age;
        uint ID;
        // vaccinated location
        string location;
    }

    registers[] register;

    mapping(address => bool) public isVaccinated;
    mapping(address => registers) public details;

    function setter(
        string memory _name,
        uint8  _age,
        uint _ID,
        string memory _location
    ) 
        public {
            require(isVaccinated[msg.sender]==false,"already registered");
            registers memory R;
            R.name = _name;
            R.age=_age;
            R.ID=_ID;
            R.location=_location;
            register.push(R);
            isVaccinated[msg.sender]=true;
            details[msg.sender]=R;
    }
}