import UIKit

func isSameStr(arr: [String]) -> Bool {
    var firstCheck = ""
    var passedLetters = ""
    var previousWord = ""
    var count = 0
    
    for str in arr {
        for char in str {
            count += 1
            if count == str.count && char != "$" {
                passedLetters += "\(firstCheck)\(char)"
                firstCheck = ""
            } else if char != "$" {
                passedLetters += firstCheck
                firstCheck = String(char)
            } else {
                firstCheck = ""
            }
        }
        if previousWord == "" {
            previousWord = passedLetters
            passedLetters = ""
        } else if passedLetters != previousWord {
            return false
        } else {
            previousWord = passedLetters
            passedLetters = ""
        }
        count = 0
    }
    return true
}

isSameStr(arr: ["af$stt$", "ast"])
