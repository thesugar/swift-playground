//: # 変数と定数、 if 文
//: * [実装例へ](@previous)
import Foundation

// 定数（再代入不可）
let score1: Int = 23

// 値から型推論できる場合は、型を省略可能
let score2 = 35

// 変数（再代入可能）
var sum = 0
sum = score1 + score2

// if-else文による条件分岐
if sum > 100 {
    print("合格：\(sum)点")
} else {
    print("不合格：\(sum)点")
}


