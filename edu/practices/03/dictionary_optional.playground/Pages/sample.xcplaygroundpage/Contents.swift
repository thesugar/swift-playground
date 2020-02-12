//: # ディクショナリと Optional
//: * [練習用へ](@next)
import Foundation

// キーがString、値がIntのディクショナリ
let prices: [String: Int] = ["ペン": 120, "ノート": 350, "消しゴム": 980]

// 指定したキーが存在しない場合はnilとなるため、Optional型で返される
let penPrice: Int? = prices["ペン"]
let tapePrice: Int? = prices["テープ"]

// if-let文でOptionalから値を取り出し、nilの場合はelseブロックを実行
if let price = penPrice {
    print("ペンの価格: \(price)円")
} else {
    print("ペンはありません")
}

if let price = tapePrice {
    print("テープの価格: \(price)円")
} else {
    print("テープはありません")
}

// !を利用するとnilチェックなしで値を取り出せるが、nilだった場合には実行時エラー発生
print("ペンの価格: \(penPrice!)円")
// print("テープの価格: \(tapePrice!)円") // 実行時エラー
