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

        // ナビゲーションバーの右側に、編集ボタンを追加
        self.navigationItem.rightBarButtonItem = self.editButtonItem
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

    /// セルの削除または挿入を行う
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCell.EditingStyle,
                            forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 削除モードの場合の処理
            // テーブルビューから削除する場合は、必ず実際のデータを先に削除
            items.remove(at: indexPath.row)
            
            // テーブルビューから、指定した行のデータを削除
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // 挿入モードの場合の処理
        }
    }

    /// セルの移動を行う
    override func tableView(_ tableView: UITableView,
                            moveRowAt sourceIndexPath: IndexPath,
                            to destinationIndexPath: IndexPath) {
        // 元データから、移動元の位置のデータを削除
        let item = items.remove(at: sourceIndexPath.row)

        // 削除したデータを、移動先の位置に挿入
        items.insert(item, at: destinationIndexPath.row)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - 画面遷移

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 次画面のビューコントローラと選択行のIndexPathが取得できた場合のみ、後続の処理を行う
        guard let dest = segue.destination as? DetailViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        // 表示する画像名を、次の画面へ渡す
        dest.imageName = items[indexPath.row].imageName
    }
}
