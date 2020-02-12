import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    @IBAction func morningButtonTapped(_ sender: UIButton) {
        label.text = "おはようございます。"
    }

    @IBAction func eveningButtonTapped(_ sender: UIButton) {
        label.text = "こんばんは。"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
