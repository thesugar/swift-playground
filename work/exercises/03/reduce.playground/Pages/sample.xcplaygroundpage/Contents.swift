//: # 解答例
//: ## reduce
//: * [演習へ](@previous)
import Foundation

let messages = ["Hello", "Hi", "Thanks", "Bye"]

let messageCounts = messages.map { (message) -> Int in
    message.count
}

let totalCharacters = messageCounts.reduce(0) { (sum, count) -> Int in
    sum + count
}

print("\(totalCharacters)文字")

//: - - -
// 別解
/*
let totalCharacters2 = messages.reduce(0) { (sum, message) -> Int in
    sum + message.count
}

print("\(totalCharacters2)文字")
*/
