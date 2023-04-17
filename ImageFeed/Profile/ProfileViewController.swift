import UIKit

final class ProfileViewController: UIViewController{
    
    private var nameLabel: UILabel?
    private var profileImageView = UIImageView()
    private var exitProfileButton = UIButton()
    private var nickLabel: UILabel?
    private var userTextLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createProfileImage()
        createNameLabel()
        createNickLabel()
        createUserTextLabel()
        createExitProfileButton()
        
    }
    
    private func createProfileImage(){
        let profileImage = UIImage(named: "user_mock")
        profileImageView = UIImageView(image: profileImage)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    private func createNameLabel(){
        nameLabel = UILabel()
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        nameLabel?.text = "Екатерина Новикова"
        nameLabel?.textColor = .white
        nameLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 23)
        view.addSubview(nameLabel!)
        nameLabel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameLabel?.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createNickLabel(){
        nickLabel = UILabel()
        nickLabel?.translatesAutoresizingMaskIntoConstraints = false
        nickLabel?.text = "@ekaterinaNov"
        nickLabel?.textColor = .gray
        view.addSubview(nickLabel!)
        nickLabel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nickLabel?.topAnchor.constraint(equalTo: nameLabel!.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createUserTextLabel(){
        userTextLabel = UILabel()
        userTextLabel?.translatesAutoresizingMaskIntoConstraints = false
        userTextLabel?.text = "Hello, world!"
        userTextLabel?.textColor = .white
        view.addSubview(userTextLabel!)
        userTextLabel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        userTextLabel?.topAnchor.constraint(equalTo: nickLabel!.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createExitProfileButton(){
        exitProfileButton = UIButton.systemButton(with: UIImage(systemName: "ipad.and.arrow.forward")!, target: self, action: #selector(self.logOut))
        exitProfileButton.translatesAutoresizingMaskIntoConstraints = false
        exitProfileButton.tintColor = .red
        view.addSubview(exitProfileButton)
        exitProfileButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        exitProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func logOut(){

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
