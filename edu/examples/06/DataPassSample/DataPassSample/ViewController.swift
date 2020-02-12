import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        print("Returned")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先のビューコントローラを取得
        guard let dest = segue.destination as? SecondViewController else {
            return
        }

        // タップされたボタンを取得
        guard let button = sender as? UIButton else {
            return
        }

        // タップされたボタンのtagプロパティの値を、遷移先ビューコントローラのプロパティへ代入
        dest.imageIndex = button.tag
    }
}
