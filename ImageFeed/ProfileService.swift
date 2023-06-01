import Foundation

final class ProfileService{
    
}

struct ProfileResult: Codable{
    let userName: String
    let firstName: String
    let lastName: String
    let bio: String?
    
    //Определяем свойства структуры, которые соответствуют полям ответа сервера.
    enum CodingKeys: String, CodingKey{
        case userName = "username"
        case firstName = "first_name"
        case lastName = "last_name"
        case bio = "bio"
    }
}
