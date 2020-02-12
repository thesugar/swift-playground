//: # 解答例
//: ## map
//: * [演習へ](@previous)
import Foundation

let names = ["John", "Masao", "Michel", "Kaoru"]

let countOfNames = names.map { (name) -> Int in
    name.count
}

print(countOfNames)
