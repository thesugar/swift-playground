import UIKit

class TableViewController: UITableViewController {
    /// テーブルに表示するデータ
    var items: [(text: String, detail: String, imageName: String)] = [
        ("バッグ1", "セレブなあなたのために。", "bag1"),
        ("バッグ2", "とにかく丈夫です。", "bag2"),
        ("時計1", "設置には多少のスペースが必要です。", "clock1"),
        ("時計2", "だいたいわかります。", "clock2"),
        ("メガネ1", "知的な印象を与えます。", "glasses1"),
        ("メガネ2", "個性が光ります。", "glasses2"),
        ("帽子1", "日差しを避けて涼しさを。", "hat1"),
        ("帽子2", "夏にぴったりです。", "hat2"),
        ("洋服1", "街中で視線を集めます。", "suit1"),
        ("洋服2", "機能性が非常に高いです。", "suit2"),
        ("シューズ1", "歩きやすさを重視。", "shoes1"),
        ("シューズ2", "山歩きにどうぞ。", "shoes2"),
        ("財布1", "情熱の赤で金運もアップ。", "wallet1"),
        ("財布2", "シックな大人の雰囲気が漂います。", "wallet2")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /// セクションの数を返す（デフォルトが1なので、セクションを分割しない場合は削除してOK）
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    /// セクションごとの行数を返す
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        // セクションを分割しないので、全データ数を返す
        return items.count
    }

    /// セルを作成して返す
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用できるセルがあれば取得する
        // 第1引数には、ストーリーボードで設定したセルのidentifierを指定
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // セルの内容を指定
        let item = items[indexPath.row]
        cell.textLabel?.text = item.text
        cell.detailTextLabel?.text = item.detail
        cell.imageView?.image = UIImage(named: item.imageName)

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
