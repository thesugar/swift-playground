let score1: Int = 23 // 定数
let score2 = 35 // 値から型推論できる場合は、型指定を省略可能

var sum = 0
sum = score1 + score2 // 変数（再代入可能）

if sum > 80 {
    print("合格：\(sum)点")
} else {
    print("不合格：\(sum)点")
}

/*
 配列とディクショナリ、タプル
 */

// 配列の宣言
var numbers: [Int] = [5, 2, 4, 1, 3]

print(numbers)

print("先頭の要素：\(numbers[0])")

// 配列の要素を削除。戻り値は削除した要素
// numbers を let で定数として宣言していた場合、remove はできない
let deletedNumber = numbers.remove(at: 2)
print("削除した要素は \(deletedNumber) で、削除後の配列は \(numbers)")

// 配列に要素を追加
numbers.append(6)
print("要素の追加後は \(numbers)")

// for-in 文による繰り返し
var sumOfArray = 0
for n in numbers {
    sumOfArray += n
}

print("for-in による合計： \(sumOfArray)")

// 配列の要素にタプルを指定
let products: [(name: String, price: Int, quantity: Int)] = [
    ("ペン", 120, 10),
    ("ノート", 450, 28),
    ("メモ", 380, 5),
]

// products は、型注釈を書かなくても型推論されるが、片注釈を書くと product.name のようにアクセスできるので便利
for product in products {
    print("\(product.name) は \(product.price) 円で在庫は \(product.quantity) 個")
}

/*:
 JavaScript (TypeScript) ではタプルはない（TypeScript でタプル型と呼ばれているものは実際には配列）。
 TypeScript で上記と同じような実装をしようとすると
 
 ```typescript
 type Products = {
   name: string
   price: number
   quantity: number
 }[]

 const products: Products = [
    {name : "ペン", price: 120,  quantity: 45},
    {name : "ノート", price: 450,  quantity: 28},
    {name : "メモ", price: 380, quantity: 5},
 ]

 products.map(product => {
   print("\{product.name} は \{product.price} 円で在庫は \{product.quantity} 個")
 })
 ```
 
 のような書き方になる（はず）。
 */

/*
 ディクショナリと Optional
 */

// キーが String、値が Int のディクショナリ
let prices: [String: Int] = ["ペン": 120, "ノート": 350, "消しゴム": 980]

// 指定したキーが存在しない場合は nil となるため、Optional 型で返される
let penPrice: Int? = prices["ペン"]
let tapePrice: Int? = prices["テープ"]

// if-let 式（Optional Binding）で Optional から値を取り出し、nil の場合は else ブロックを実行

if let price = penPrice {
    print("ペンの価格: \(price) 円")
} else {
    print("ペンはありません")
}

if let price = tapePrice {
    print("テープの価格: \(price) 円")
} else {
    print("テープはありません")
}

// ! を利用すると nil チェックなしで値を取り出せるが、nil だった場合には実行時エラーとなる
print("ペンの価格: \(penPrice!) 円")
// print("テープの価格: \(tapePrice!) 円")

/*:
 ## 型
 ### クラス
 データのテンプレート。プログラム内では基本的に、クラスを元に生成した実態（インスタンス、オブジェクト）を利用する。参照型であり、変数同士の代入時はアドレスが渡され、両変数が同じオブジェクトを参照する。
 
 ```swift
 class クラス名 {
    // プロパティの定義
    // イニシャライザの定義
    // メソッドの定義
 }
 ```
 
 ### 構造体
 データのテンプレート。クラスとほぼ同様の構造だが、_値型_ であり、変数同士の代入時にはつねにインスタンスがコピーされる。
 
 ```swift
 struct 構造体名 {
    // プロパティの定義
    // イニシャライザの定義
    // メソッドの定義
 }
 ```
 
 ### 列挙型
 定数を定義するためのデータ構造。構造体と同様、値型である。
 
 ```swift
 enum 列挙体名 {
    // 定数の定義
 }
 ```
 
 ### プロトコル
 クラス・構造体・列挙型に、処理を追加（拡張）するための型。内部のメソッドなどは宣言のみで、実装は持たない。
 
 ```swift
 protocol プロトコル名 {
    // プロパティの型宣言
    // イニシャライザの型宣言
    // メソッドの型宣言
 }
 ```
 
 ### 関数
 処理のまとまり。Swift では関数も第一級オブジェクト（first class object）であるため、値として変数に代入できる。
 同様に、メソッドの引数や戻り値とすることも可能である。
 名前を持たない関数はクロージャと呼ばれる。クラスや構造体の内部に定義するメソッドとは異なり、特定のインスタンスに依存しない。
 ※ JavaScript の場合は `->` でなく `=>`。
 
 ```swift
 func 関数名(引数) -> 戻り値の型 {
    // 処理の内容
 }
 ```
 
 ```swift
 {
    (引数) -> 戻り値の型 in
    // 処理の内容
 }
 ```
 */


/*:
 ## 高階関数とクロージャ
 ### 高階関数
 JavaScript や Haskell などの言語と同様、SWift の関数は第一級オブジェクトであり、値として扱うことができる。すなわち、関数を変数に代入したり、引数として受け渡したり、戻り値として返すことができる。
 引数や戻り値に関数を利用する関数を **高階関数** と呼ぶ。
 
 ### クロージャ
 関数の引数や戻り値として扱われる関数には多くの場合クロージャを利用する。Swift におけるクロージャは、局所的に利用するための「名前のない関数」である。クロージャを利用することで、コードを完結に記述できる。
 
 ```swift
 // クロージャの定義（基本形）
 { (引数名: 型, 引数名: 型) -> 戻り値型 in 処理}
 
 // クロージャの定義（引数の型を省略）
 { (引数名, 引数名) -> 戻り値型 in 処理}
 
 // クロージャの定義（さらに戻り値型、引数リストのカッコを省略）
 { 引数名, 引数名 in 処理 }
 
 // クロージャの定義（さらに引数名を省略）
 { 処理 }
 ```
 
 > 引数名を省略した場合には、先頭の引数から順に `$0`, `$1` という名前で参照する。これにより記述が非常に簡潔になるが、可読性が下がることも。
 
 */

//: ## 公開関数とクロージャのサンプル
// 操作対象の配列
let targetNumbers = [11, 2, 5, -8, 0, 6]

// クロージャの基本形
let overTen = targetNumbers.filter { (number: Int) -> Bool in
    return number > 10
}

print("10 より大きい数値：\(overTen)")

// クロージャの引数の型と戻り値の型を省略
let overFive = targetNumbers.filter { number in
    return number > 5
}
print("5 より大きい数値: \(overFive)")

// クロージャ内の処理が 1 行なので、return キーワードを省略
let overTwo = targetNumbers.filter { number in number > 2 }
print("2 より大きい数値: \(overTwo)")

// クロージャの引数名を省略
let overZero = targetNumbers.filter { $0 > 0 }
print("0 より大きい数値: \(overZero)")

//: ## 配列の filter, map, reduce

// 操作対象の配列
let targetNums = [7, 14, 8, 21, 0, 5]

// filter - 要素の抽出
let oddNumbers = targetNums.filter { (number: Int) -> Bool in
    number % 2 != 0
}

print("奇数を抽出: \(oddNumbers)")

// map - 各要素の変換
// 引数の型は省略している（省略しないのなら number: Int）
let halfNumbers = targetNums.map { number -> Double in Double(number) / 2.0 }
print("各要素を 1/2 に変換: \(halfNumbers)")

// reduce - 単一の値へ集約
// クロージャを引数の末尾に渡す場合、引数リストのカッコを閉じたあとにクロージャを記述することができる。（`(0) { (sum...` の部分）
// 実際には Xcode が補完してくれるのでこういった記法を暗記する必要はない
let sumNumbers = targetNums.reduce(0) { (sum, number) -> Int in
    sum + number
}

print("合計1: \(sumNumbers)")

// クロージャの代わりに演算子を渡してもOK（演算子も関数として定義されているため）
let sumNubers2 = targetNums.reduce(0, +)
print("合計2: \(sumNubers2)")
