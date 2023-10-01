// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.6 <0.9.0;
/// @title A contract for demonstrate visibility modifiers
/// @author Jitendra Kumar
/// @notice For now, this contract just show how to use visibility modifiers in the functions and variables
abstract contract contract_example {

// Declaring private
// state variable
uint private num1;
	
// Declaring public
// state variable
uint public num2;

// Declaring Internal
// state variable
string internal str;

// Defining a constructor
constructor(){
	num2 = 10;
}

// Defining a private function
function increment(
	uint data1) private pure returns(
	uint) {
	return data1 + 1;
}
	
// Defining public functions
function updateValue(
	uint data1) public {
	num1 = data1;
}

function getValue(
) public view returns(
	uint) {
	return num1;
}

// Declaring public functions
function setStr(
	string memory _str) public virtual;

function getStr(
) public virtual returns (string memory);
}

// Child contract inheriting
// from the parent contract
// 'contract_example'
contract derived_contract is contract_example{

// Defining public function of
// parent contract
function setStr(
	string memory _str) public override{
	str = _str;
}

// Defining public function
// of parent contract
function getStr(
) public view override returns (
	string memory){
	return str;
}
}

//External Contract
contract D {
// Defining a public function to create
// an object of child contract access the
// functions from child and parent contract
function readData(
) public returns(
	string memory, uint) {
	contract_example c = new derived_contract();
	c.setStr("GeeksForGeeks");
	c.updateValue(16);		
	return (c.getStr(), c.getValue());
}
}
