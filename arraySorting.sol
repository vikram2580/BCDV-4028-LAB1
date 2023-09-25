// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;


contract SortingArrayContract {
    uint[] public data;
    uint[] sortedData;
    uint[] duplicateRemovedArray;
    uint[] tempArray;

    constructor(uint[] memory _initialData) {
        data = _initialData;
    }

    function bubbleSort(uint[] memory arr)private pure returns (uint[] memory)
    {
        uint n = arr.length;
        for (uint i = 0; i < n - 1; i++) {
            for (uint j = 0; j < n - i - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    (arr[j], arr[j + 1]) = (arr[j + 1], arr[j]);
                }
            }
        }
        return arr;
    }

    function getSortedArray() public returns (uint[] memory) {
        sortedData = bubbleSort(data);
        return sortedData;
    }

    function removeDuplicates() public returns (uint[] memory) {
       
        tempArray = bubbleSort(data);
        uint n = tempArray.length;

        duplicateRemovedArray.push(tempArray[0]);
        for (uint i = 1; i < n; i++) {
            bool isDuplicate = false;
            for (uint j = 0; j < duplicateRemovedArray.length; j++) {
                if (tempArray[i] == duplicateRemovedArray[j]) {
                    isDuplicate = true;
                    break;
                }
            }
            if (!isDuplicate) {
                duplicateRemovedArray.push(tempArray[i]);
            }
        }
        return duplicateRemovedArray;
    }
}
