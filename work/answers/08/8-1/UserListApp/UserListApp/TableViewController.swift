import UIKit

class TableViewController: UITableViewController {
    
    /// テーブルに表示するユーザ情報（タプルの配列で保持）
    var users: [(name: String, department: String, title: String, phone: String)] = [
        ("山田 二郎", "システム開発部", "課長代理", "090-9999-9999"),
        ("川田 吾郎", "営業部", "一般", "080-8888-8888"),
        ("里田 舞", "人事部", "一般", "070-7777-7777"),
        ("道上 歩", "人事部", "部長", "070-0000-0000"),
        ("海川 泳三", "総務部", "係長", "080-3333-3333"),
        ("林 九郎", "システム開発部", "課長", "090-2222-2222"),
        ("土屋 草五郎", "システム開発部", "一般", "090-9900-8877"),
        ("竹下 大作", "システム開発部", "一般", "090-4455-1133"),
        ("木田 房枝", "運用部", "一般", "070-2222-5533"),
        ("砂川 黄太郎", "運用部", "次長", "090-1212-3434"),
        ("草加 平蔵", "総務部", "一般", "080-1155-5511"),
        ("水上 泉太郎", "総務部", "一般", "090-0099-7722"),
        ("畑山 耕史", "システム開発部", "本部長", "090-2929-3535"),
        ("浪江 乗太郎", "システム開発部", "係長代理補佐", "080-8787-5454")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    /// セクションの数を返す
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    /// セクションごとのセルの数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    /// セルを作成して返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.title

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
