import Foundation

final class ProfileService{
    private var fetchProfileTask: URLSessionTask?
    
    func fetchProfile(_ token: String, completion: @escaping (Result<Profile, Error>) -> Void){
        fetchProfileTask?.cancel()
        
        var request = URLRequest(url: ProfileURL)
    }
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

struct Profile: Codable{
    let userName: String
    let name: String
    let loginName: String
    let bio: String?
}
