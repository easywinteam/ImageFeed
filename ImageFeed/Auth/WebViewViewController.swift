import UIKit
import WebKit

final class WebViewViewController: UIViewController{
    
    @IBOutlet var webView: WKWebView!
    weak var delegate: WebViewViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
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
    
    private func code(from navigationAction: WKNavigationAction) -> String?{
        if let url = navigationAction.request.url,
           let urlComponents = URLComponents(string: url.absoluteString),
           urlComponents.path == "/oauth/authorize/native",
           let items = urlComponents.queryItems,
           let codeItem = items.first(where: { $0.name == "code"}){
            return codeItem.value
        }else{
            return nil
        }
    }
    
}


extension WebViewViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let code = code(from: navigationAction){
            //TODO: process code
            decisionHandler(.cancel)
        }else{
            decisionHandler(.allow)
        }
    }
}
