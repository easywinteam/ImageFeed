import UIKit

final class ProfileViewController: UIViewController{
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var userFullName: UILabel!
    @IBOutlet var userNickName: UILabel!
    
    @IBOutlet var userGreetings: UILabel!
    
    @IBAction func signOut(_ sender: Any) {
        print("Max Cool")
    }
    
}
