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
        ("ヴェネチア", "リアルト橋です", "IMG_6123"),
        ("フィレンツェの街", "いい道です", "IMG_6908"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        cell.imageView?.image = UIImage(named: item.imegaName)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
