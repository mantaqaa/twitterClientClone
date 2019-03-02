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

        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 15
    }

    @IBAction func onTapLogin(_ sender: Any) {
        let urlString = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: urlString, success: {
            // on login success, present homeTableVC
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            // notify user error has occurred
            print("Error. Could not log in.")
            // set up an alert controller
            let title = "Error"
            let message = "An error has occured. Unable to log-in."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
    
}
