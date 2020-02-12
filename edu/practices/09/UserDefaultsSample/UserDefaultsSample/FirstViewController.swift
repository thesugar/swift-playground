import UIKit

class FirstViewController: UIViewController {
    /// 利用する背景色用の列挙型を定義
    enum WallpaperColor: Int {
        case whiteColor = 0
        case grayColor, brownColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UserDefaultsオブジェクトを取得
        let defaults = UserDefaults.standard

        // UserDefaultsに格納された値を取得
        let selectedIndex = defaults.integer(forKey: "colorIndex")
        
        // 取得した値をもとに列挙型を作成し、対応する値がある場合のみ処理を続行
        guard let color = WallpaperColor(rawValue: selectedIndex) else { return }
        
        // 背景色に設定するためのUIColor
        let selectedColor: UIColor
        
        // 取得した値をもとに、ビューの背景色を設定
        switch color {
        case .whiteColor:
            selectedColor = .white
        case .grayColor:
            selectedColor = .gray
        case .brownColor:
            selectedColor = .brown
        }
        
        // 背景色を設定
        self.view.backgroundColor = selectedColor
    }
}

