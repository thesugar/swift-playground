//: # 解答例
//: ## ディクショナリの操作と Optional
//: * [演習へ](@previous)
import Foundation

let products: [String: Int] = ["バット": 900, "ボール": 2500, "グローブ": 150, "ベース": 1200]

let ballPrice = products["ボール"]

if let price = ballPrice {
    print("ボールの値段 -> \(price)円")
} else {
    print("データがありませんでした。")
}

let glassesPrice = products["サングラス"]

if let price = glassesPrice {
    print("サングラスの値段 -> \(price)")
} else {
    print("データがありませんでした。")
}
