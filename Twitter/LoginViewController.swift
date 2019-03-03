//
//  LoginViewController.swift
//  Twitter
//
//  Created by Matthew Rodriguez on 3/1/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
     
        if UserDefaults.standard.bool(forKey:"userLoggedIn")==true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }

    }
    
    
    
    

    @IBAction func onTapLogin(_ sender: Any) {
        let urlString = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: urlString, success: {
            // on login success, present homeTableVC
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        
            
        }, failure: { (Error) in
            // notify user error has occurred
            print("Error. Could not log in.")
        })
    }
    

}
