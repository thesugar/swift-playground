import Foundation

/*
 ===================================
 文字列加工のサンプル
 ===================================
 */

// 改行区切りの文字列
var str = "山田\n川上\n竹内\n松下\n梅津\n"
print(str)
print("----------")

// components(separatedBy:)メソッドにより、改行文字で区切った配列を作成
let names: [String] = str.components(separatedBy: "\n")
print(names)
print("----------")

// filter(_:)メソッドにより、空文字列を除外
let notEmptyNames: [String] = names.filter { (name) -> Bool in
    !name.isEmpty
}
print(notEmptyNames)
print("----------")

// reversed()メソッドにより、配列の要素を逆順にする
let reversedNames: [String] = notEmptyNames.reversed()
print(reversedNames)
print("----------")

// joined(separator:)メソッドにより、改行文字を間に挟んだ単一の文字列に結合
let result: String = reversedNames.joined(separator: "\n")
print(result)
print("----------")
