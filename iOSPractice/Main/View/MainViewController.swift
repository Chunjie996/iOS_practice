// Copyright \(c\) 201[6-9]

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var fetchUserButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fetchUserPressed(_ sender: UIButton) {
        let userRequest = APIGet(resource: UserResource())
        userRequest.call(withCompletion: logUser)
    }
    
    func logUser(users: [User]?) {
        guard let users = users else {
            print("None returned")
            return
        }
        print(users)
    }
}
