import UIKit
import Kingfisher

final class ProfileViewController: UIViewController{
    
    private var nameLabel: UILabel?
    private var profileImageView = UIImageView()
    private var exitProfileButton = UIButton()
    private var nickLabel: UILabel?
    private var userTextLabel: UILabel?
    
    private let profileService = ProfileService.shared
    private let tokenStorage = OAuth2TokenStorage()
    private var profileImageServiceObserver: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createProfileImage()
        createNameLabel()
        createNickLabel()
        createUserTextLabel()
        createExitProfileButton()
        
        guard let token = tokenStorage.token else { return }
        
        profileImageServiceObserver = NotificationCenter.default
            .addObserver(
                forName: ProfileImageService.didChangeNotification,
                object: nil,
                queue: .main
            ) { [weak self] _ in
                guard let self = self else { return }
                 self.updateAvatar()
            }
        updateAvatar()
        updateProfileDetails(profile: profileService.profile)
    }
    
    private func createProfileImage(){
        let profileImage = UIImage(named: "user_mock")
        profileImageView = UIImageView(image: profileImage)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 76).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    }
    
    private func createNameLabel(){
        nameLabel = UILabel()
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        nameLabel?.text = "Eкатерина Новикова"
        nameLabel?.textColor = .white
        nameLabel?.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        view.addSubview(nameLabel!)
        nameLabel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nameLabel?.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createNickLabel(){
        nickLabel = UILabel()
        nickLabel?.translatesAutoresizingMaskIntoConstraints = false
        nickLabel?.text = "@ekatNov"
        nickLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        nickLabel?.textColor = UIColor(named: "YP Gray")
        view.addSubview(nickLabel!)
        nickLabel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nickLabel?.topAnchor.constraint(equalTo: nameLabel!.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createUserTextLabel(){
        userTextLabel = UILabel()
        userTextLabel?.translatesAutoresizingMaskIntoConstraints = false
        userTextLabel?.text = "Hello World"
        userTextLabel?.textColor = .white
        userTextLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        view.addSubview(userTextLabel!)
        userTextLabel?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        userTextLabel?.topAnchor.constraint(equalTo: nickLabel!.bottomAnchor, constant: 8).isActive = true
    }
    
    private func createExitProfileButton(){
        exitProfileButton = UIButton.systemButton(with: UIImage(systemName: "ipad.and.arrow.forward")!, target: self, action: #selector(self.logOut))
        exitProfileButton.translatesAutoresizingMaskIntoConstraints = false
        exitProfileButton.tintColor = UIColor(named: "YP Red")
        view.addSubview(exitProfileButton)
        exitProfileButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        exitProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26).isActive = true
    }
    
    @objc func logOut(){

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func updateProfileDetails(profile: Profile?) {
        if let profile = profile {
            nameLabel?.text = profile.name
            nickLabel?.text = profile.loginName
            userTextLabel?.text = profile.bio
        } else {
            nameLabel?.text = "Error"
            nickLabel?.text = "Error"
            userTextLabel?.text = "Error"
        }
    }
    
    private func updateAvatar() {
        guard
            let profileImageURL = ProfileImageService.shared.avatarURL,
            let url = URL(string: profileImageURL)
        else { return }
        
        let placeholderImage = UIImage(named: "user_mock")
        profileImageView.kf.setImage(with: url, placeholder: placeholderImage)
    }
}
