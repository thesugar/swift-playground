import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!

    @IBAction func buttonTapped(_ sender: UIButton) {
        // セグエのidentifierを指定して画面遷移
        let identifier = segment.selectedSegmentIndex == 0 ? "lionImage" : "lionDescription"
        performSegue(withIdentifier: identifier, sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        print("Returned")
    }
}
