import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!

    @IBAction func showButtonTapped(_ sender: UIButton) {
        let identifier: String

        if segment.selectedSegmentIndex == 0 {
            identifier = "eagle"
        } else {
            identifier = "peacock"
        }

        // セグエのidentifierプロパティを指定して、画面遷移
        performSegue(withIdentifier: identifier, sender: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        print("Returned")
    }
}
