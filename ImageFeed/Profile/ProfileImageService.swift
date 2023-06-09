import UIKit

final class ProfileImageService {
    
}

struct UserResult: Codable {
    let profileImage: ProfileImage
    
    enum codingKeys: String, CodingKey {
        case profileImage = "profile_image"
    }
    
    struct ProfileImage: Codable {
        let small: String
    }
}
