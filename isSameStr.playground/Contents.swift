import UIKit

var passedWord = ""
var previousLetter = ""
var found$ = false
var count = 1

func stringFilter(str: String) {
    for char in str { // n
        if found$ {
            passedWord += String(char)
            count += 1
        } else if char == "$" {
            found$ = true
            count += 1
        } else if count == str.count {
            passedWord += "\(previousLetter)\(char)"
        } else {
            passedWord += previousLetter
            previousLetter = String(char)
            count += 1
        }
    }
}

func reset() {
    previousLetter = ""
    passedWord = ""
    count = 1
}

func isSameStr(arr: [String]) -> Bool {
    guard !arr.isEmpty else { return false }
    guard arr.count > 1 else { return true }
    
    var strArr = arr
    
    stringFilter(str: strArr.last!) // n
    strArr[strArr.count - 1] = passedWord
    reset()
    
    if found$ {
        found$ = false
        return isSameStr(arr: strArr)
    }
    
    stringFilter(str: strArr[arr.count - 2])
    strArr[strArr.count - 2] = passedWord
    reset()
    
    if found$ {
        found$ = false
        return isSameStr(arr: strArr)
    } else if strArr.last! != strArr[strArr.count - 2] {
        return false
    } else {
        strArr.popLast()
        return isSameStr(arr: strArr)
    }
    
}

isSameStr(arr: ["af$stt$", "ast"])

