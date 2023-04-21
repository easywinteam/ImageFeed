import UIKit
import WebKit

final class WebViewViewController: UIViewController{
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents(string: UnsplashAuthorizeURLString)! 
        urlComponents.queryItems = [
           URLQueryItem(name: "client_id", value: AccessKey),                  //2
           URLQueryItem(name: "redirect_uri", value: RedirectURI),             //3
           URLQueryItem(name: "response_type", value: "code"),                 //4
           URLQueryItem(name: "scope", value: AccessScope)                     //5
         ]
        let url = urlComponents.url!
        let request = URLRequest(url: url)
        webView.load(request)
        
    }
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
    }
    
}
