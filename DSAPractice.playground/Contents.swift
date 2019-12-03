import UIKit

func quickSorted<T: Comparable>(arr: [T], by isSorted:(T, T) -> Bool) -> [T] {
    // base case
    guard arr.count > 1 else { return arr }
    
    let pivot = arr[arr.count - 1]
    
    var smaller: [T] = []
    var equal: [T] = []
    var bigger: [T] = []
    
    for element in arr {
        if isSorted(element, pivot) {
            smaller.append(element)
        } else if element == pivot {
            equal.append(element)
        } else {
            bigger.append(element)
        }
    }
    return quickSorted(arr: smaller, by: isSorted) + equal + quickSorted(arr: bigger, by: isSorted)
}

//let insertionSortStartTime = Date()
//var randomArr = (1...10000).map { _ in Int.random(in: 1...100000000)}
//let sortedArr = quickSorted(arr: randomArr, by: <)
//print("\(Date().timeIntervalSince(insertionSortStartTime))")

func twoSum(_ array: [Int], _ target: Int) -> [Int] {
    var indexes = [Int: Int]()

    for index in 0..<array.count {
        let value = array[index]
        indexes[value] = index
    }

    for index in 0..<array.count {
        let value = array[index]
        if let otherIndex = indexes[target - value],
           index != otherIndex {
            return [index, otherIndex]
        }
    }
    fatalError("Unable to match values")
}

