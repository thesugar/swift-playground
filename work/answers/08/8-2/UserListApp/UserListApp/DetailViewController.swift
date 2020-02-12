import UIKit

class DetailViewController: UIViewController {
    
    /// ユーザ情報受け取り用
    var user: (name: String, department: String, title: String, phone: String)?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = user?.title
        departmentLabel.text = user?.department
        nameLabel.text = user?.name
        phoneLabel.text = user?.phone
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
