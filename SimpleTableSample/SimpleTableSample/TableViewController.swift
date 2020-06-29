//
//  TableViewController.swift
//  SimpleTableSample
//
//  Created by 佐藤遼平 on 2020/06/28.
//  Copyright © 2020 佐藤遼平. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // テーブルに表示するデータ
    var items: [(text: String, detail: String, imegaName: String)] = [
        ("コペンハーゲンの街並み", "おしゃれな街でした", "IMG_2975"),
        ("ストロイエ", "コペンハーゲンの歩行者天国", "IMG_2931"),
        ("ガムラスタンの夜", "忘れ得ない街", "IMG_3438"),
        ("ストックホルム中央駅", "かっこよさとおしゃれさと", "IMG_3735"),
        ("海の見える街・オスロ", "おしゃれなカフェがありました", "IMG_4394"),
        ("オスロの街並み", "夕方のオスロは最高です", "IMG_4484"),
        ("ゴンドラ", "ヴェネチアで乗ったゴンドラ", "IMG_6016"),
        ("ヴェネチア", "リアルト橋です", "IMG_6123"),
        ("アメリカ・イン・フィレンツェ","フィレンツェにあったアメリカンなお店。","IMG_6307"),
        ("黄金色に光るフィレンツェ","金色のライトに照らされた街がきれいでした","IMG_6325"),
        ("メリーゴーランドのある広場","おいしいレストランも立ち並ぶフィレンツェの広場。","IMG_6389"),
        ("ドゥオモから眺める街","長い階段を登ったあとは絶景が待っていました","IMG_6503"),
        ("ベッキオ橋", "おしゃれな橋ですね", "IMG_6624"),
        ("フィレンツェの街", "いい道です", "IMG_6908"),
        ("スペイン広場","近くにスペイン大使館があるからスペイン広場というらしい","IMG_7000"),
        ("パンテオン宮殿","厳かな雰囲気がありました","IMG_7586"),
        ("サン・ピエトロ大聖堂", "大迫力！", "IMG_7973"),
        ("バチカン市国の街", "こういう構図もいいよね", "IMG_8159"),
        ("ローマの街並み","洗練された街でした","IMG_8196"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // ナビゲーションバーの右側に編集ボタンを追加
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    // セクションの数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // セクションごとの行数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count // セクションを分割しないので、全データ数を返す
    }

    // セルを作成して返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用できるセルがあれば取得する
        // 第一引数には、ストーリーボードで設定したセルの identifier を指定
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // セルの内容を指定
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        cell.detailTextLabel?.text = item.detail
        // 以下は https://teratail.com/questions/31558 と https://teratail.com/questions/185277 を参考にした（特に後者）
        if let image = UIImage(named: item.imegaName) {
            cell.imageView?.image = image.resize(size: CGSize(width: 200, height: 100))

            // 以下をコメントアウトを外せば、赤い線で画像を囲むことができる
            //cell.imageView?.layer.borderColor = UIColor.red.cgColor
            //cell.imageView?.layer.borderWidth = 1
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 削除モードの場合の処理。テーブルビューから削除する場合は、必ず実際のデータを先に削除！
            // データの削除をせずにセルだけを削除した場合はエラーが発生する。
            // これはテーブルビューコントローラがデータソースと連携しており、表示内容と実データの整合性が
            // 取れていないとみなされるため。
            // 以下の一行のみ追加（他の記述はすべてデフォルトでコメントアウトされて用意されている）
            items.remove(at: indexPath.row)
            
            // Delete the row from the data source
            // テーブルビューから、指定した行のデータを削除。
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // 次画面のビューコントローラと選択行の indexPath が取得できた場合のみ、後続の処理を行う
        // as? はキャストだが、キャストに失敗したら nil を入れるという意味
        guard let dest = segue.destination as? DetailViewController else { return }
        // tableView プロパティは、UITableViewController（このクラスが継承している親クラス）が保持しているプロパティで、
        // 自身が制御する UITableView を指すもの。
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        dest.imageName = items[indexPath.row].imegaName
    }

}
