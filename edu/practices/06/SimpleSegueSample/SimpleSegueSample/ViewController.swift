import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue){
        
        let sourceViewController = unwindSegue.source
        
        print("Returned")
    }
}
