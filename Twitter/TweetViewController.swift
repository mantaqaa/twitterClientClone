//
//  TweetViewController.swift
//  Twitter
//
//  Created by Mantaqaa Khan on 3/9/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var TweetTextView: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Tweet(_ sender: Any) {
        if(!TweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: TweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
                
            }, failure: { (error) in
                print ( "Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else { self.dismiss(animated: true, completion: nil) }

        
    }
}
