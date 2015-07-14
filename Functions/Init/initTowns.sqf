/////////////////////////
//Script made by Jochem//
/////////////////////////
_j = 0;
//Occupy towns
while{_j < townCount}do{
    [] spawn JOC_occupy;
    _j = _j + 1;
    Sleep 0.1;
};
[] spawn JOC_indTown;
Sleep 5;