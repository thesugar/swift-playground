import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!

    @IBAction func switchValueChanged(_ sender: UISwitch) {
        // TODO: スイッチがoffにされた場合は、ダイアログを表示
        if !sender.isOn {
            let alert = UIAlertController(title: "無効化",
                                          message: "テキストフィールドとボタンが無効化されました。",
                                          preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }

        // TODO: テキストフィールドとボタンの有効状態を、スイッチのon/offに連動させる
        textField.isEnabled = sender.isOn
        button.isEnabled = sender.isOn
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        label.text = textField.text
        textField.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
