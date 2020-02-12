import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!

    @IBAction func buttonTapped(_ sender: UIButton) {
        let lastName = lastNameTextField.text!
        let firstName = firstNameTextField.text!
        
        label.text = lastName + " " + firstName
        
        lastNameTextField.text = ""
        firstNameTextField.text = ""
        
        view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
