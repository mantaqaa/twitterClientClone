//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Mantaqaa Khan on 3/2/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    var favorited: Bool = false
    var retweeted: Bool = false
    var tweetId: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
     
        profleimageView.layer.masksToBounds = false
        profleimageView.layer.cornerRadius = profleimageView.frame.height / 2
        profleimageView.clipsToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
      
    }
    
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var profleimageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    
    @IBAction func retweet(_ sender: Any) {
    }
    
    func setRetweeted(_ isRetweeted: Bool) {
        retweeted = isRetweeted
        if (retweeted) {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {  favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            
        }
    }
    
    @IBAction func favoritetweet(_ sender: Any) {
        
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
}
   
    
}
