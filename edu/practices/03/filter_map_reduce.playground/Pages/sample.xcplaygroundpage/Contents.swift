//: # 配列の filter, map, reduce
//: * [練習用へ](@next)
import Foundation

// 操作対象の配列
let numbers = [7, 14, 8, 21, 0, 5]

// filter - 要素の抽出
let oddNumbers = numbers.filter { number -> Bool in number % 2 != 0 }

print("奇数を抽出: \(oddNumbers)")

// map - 各要素の変換
let halfNumbers = numbers.map { number -> Double in Double(number) / 2.0 }

print("各要素を1/2に変換: \(halfNumbers)")

// reduce - 単一の値へ集約
let sumNumbers = numbers.reduce(0) { (sum, number) -> Int in sum + number }

print("合計1: \(sumNumbers)")

// クロージャの代わりに演算子を渡してもOK（演算子も関数として定義されているため）
let sumNumbers2 = numbers.reduce(0, +)

print("合計2: \(sumNumbers2)")
