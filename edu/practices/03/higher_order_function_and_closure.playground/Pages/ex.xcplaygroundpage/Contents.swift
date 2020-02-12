//: # 高階関数とクロージャ
//: * [実装例へ](@previous)
import Foundation

// 操作対象の配列
let numbers = [11, 2, 5, -8, 0, 6]

// クロージャの基本形
// 唯一の引数がクロージャであるため、filterメソッドから引数リストのカッコを省略
let overTen = numbers.filter { (number: Int) -> Bool in
    return number > 10
}

print("10より大きい数値: \(overTen)")

// クロージャの引数の型と戻り値の型を省略



print("5より大きい数値: ")

// クロージャ内の処理が1行なので、returnキーワードを省略



print("2より大きい数値: ")

// クロージャの引数名を省略



print("0より大きい数値: ")
