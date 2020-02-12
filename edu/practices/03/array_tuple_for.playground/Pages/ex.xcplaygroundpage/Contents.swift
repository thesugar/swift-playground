//: # 配列、タプル、 for 文
//: * [実装例へ](@previous)
import Foundation

// 配列の宣言（要素はInt型）
var numbers: [Int] = [5, 2, 4, 1, 3]

print(numbers)

// インデックスで配列の要素を参照
print("先頭の要素: \(numbers[0])")

// 配列の要素を削除、戻り値は削除した要素
let num = numbers.remove(at: 2)
print(num)

// 配列に要素を追加
numbers.append(6)
print(numbers)

var sum = 0

// for-in文による繰り返し
for n in numbers{
    sum += n
}

print("for-inによる合計: \(sum)")

// 配列の要素にタプルを指定
let products: [(name: String, price: Int, quantity: Int)] = [
    ("ペン", 120, 10),
    ("ノート", 450, 28),
    ("メモ", 380, 5)
]

for product in products {
    print("\(product.name)は\(product.price)円で、在庫は\(product.quantity)個だよ")
}


