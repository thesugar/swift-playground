import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        // 入力値を取得し、整数に変換
        let number1: Int? = Int(textField1.text!)
        let number2: Int? = Int(textField2.text!)

        let resultMessage: String

        if let number1 = number1, let number2 = number2 {
            // 両方とも整数が入力されていた場合
            let result = number1 + number2
            resultMessage = "\(number1) + \(number2) = \(result)"
        } else {
            // 整数が入力されていなかった場合
            resultMessage = "整数を入力してください。"
        }


        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
