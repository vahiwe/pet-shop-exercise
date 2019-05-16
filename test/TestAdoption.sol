pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // Testing the adopt function
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(8);

        uint expected = 8;

        Assert.equal(returnedId, expected, "Adoption of petId 8 should be recorded");
    }

    // Testing Retrieval of a single Pet's owner
    function testGetAdopterAddressByPetId() public {
        address expected = address(this);

        address adopter = adoption.adopters(8);

        Assert.equal(adopter, expected, "Owner of petId 8 should be recorded");

    }


    // Testing Retrieval of all pets owner
    function testGetAdopterAddressByPetIdInArray() public {
        address expected = address(this);

        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[8], expected, "Owner of petId 8 should be recorded");

    }
}