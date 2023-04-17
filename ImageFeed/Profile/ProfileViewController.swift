import UIKit

final class ProfileViewController: UIViewController{
    
    private var nameLabel: UILabel?
    private var profileImageView = UIImageView()
    private var exitProfileButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createProfileImage()
        createNameLabel()
        createExitProfileButton()
        
    }
    
    private func createProfileImage(){
        var profileImage = UIImage(systemName: "person.crop.circle.fill")
        profileImageView = UIImageView(image: profileImage)
        profileImageView.tintColor = .gray
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
        view.addSubview(nameLabel!)
        nameLabel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameLabel?.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createExitProfileButton(){
        exitProfileButton = UIButton.systemButton(with: UIImage(systemName: "ipad.and.arrow.forward")!, target: self, action: #selector(self.removeLabel))
        exitProfileButton.translatesAutoresizingMaskIntoConstraints = false
        exitProfileButton.tintColor = .red
        view.addSubview(exitProfileButton)
        exitProfileButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        exitProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func removeLabel(){
        nameLabel?.removeFromSuperview()
        print("Selector was called")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
