//: # ディクショナリと Optional
//: * [実装例へ](@previous)
import Foundation

// キーがString、値がIntのディクショナリ
let prices: [String: Int] = ["ペン": 120, "ノート": 350, "消しゴム": 980]

// 指定したキーが存在しない場合はnilとなるため、Optional型で返される
let penPrice: Int? = prices["ペン"]
print(penPrice) // Optional(120)

let tapePrice: Int? = prices["テープ"] // nil
print(tapePrice)

// if-let文でOptionalから値を取り出し、nilの場合はelseブロックを実行
if let price = penPrice {
    // 取り出した値が price に代入できた場合
    print(price)
} else {
    // nil だった場合
    print("ペンはないよ")
}

if let price = tapePrice {
    print(price)
} else {
    print("テープはないぞ")
}


// !を利用するとnilチェックなしで値を取り出せるが、nilだった場合には実行時エラー発生
print("ペンの価格: \(penPrice!)円")
//print("テープの価格: \(tapePrice!)円") // 実行時エラー
