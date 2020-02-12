import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        // TODO: スイッチがoffにされた場合は、ダイアログを表示



        // TODO: テキストフィールドとボタンの有効状態を、スイッチのon/offに連動させる



    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = textField.text
        textField.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
