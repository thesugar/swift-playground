//: # 型とインスタンス
//: * [練習用へ](@next)
import Foundation

// イニシャライザを利用したインスタンス化
let n1 = Int(10.5)

// Int型のリテラルを利用
let n2 = 20

print("n1 + n2 = \(n1 + n2)")

// メソッドの呼び出し（5つ後の値を取得）
let n3 = n1.advanced(by: 5)

print("\(n1)の5つ後の数: \(n3)")
