import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // 変更された後の値を取得
        let newValue: Double = sender.value

        // 値が小数点以下を持つため、Intに変換してラベルに表示
        label.text = "\(Int(newValue))"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        // ラベルの表示内容とステッパーの値を0に初期化
        label.text = "0"
        stepper.value = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
