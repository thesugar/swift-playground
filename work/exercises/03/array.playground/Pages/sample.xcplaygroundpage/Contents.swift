//: # 解答例
//: ## 配列の操作
//: * [演習へ](@previous)
import Foundation

let numbers: [Int] = [5, 3, 1, 7, 9]

var sum = 0

for n in numbers {
    sum += n
}

print("合計 -> \(sum)")
