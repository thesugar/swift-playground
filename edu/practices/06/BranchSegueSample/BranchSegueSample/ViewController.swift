import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!

    @IBAction func showButtonTapped(_ sender: UIButton) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        print("Returned")
    }
}
