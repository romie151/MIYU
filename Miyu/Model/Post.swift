//
//  Post.swift
//  Miyu
//
//  Created by Mira Estil on 2/7/18.
//  Copyright © 2018 ME. All rights reserved.
//

import Foundation

internal final class Post: NSObject {
    
    //private var title: String?
     var caption: String?
     var data: String?
     var rating: Double?
    
    init(rating: Double?, caption: String?, data: String?) {
        self.rating = rating
        self.caption = caption
        self.data = data
    }
    
    static func createPost(with dict: [String:AnyObject]) -> Post? {
        var validPost: Post?
        print("CREATING POST w/ DICT \(dict)")
        guard let caption = dict["caption"] as? String,
            let data = dict["data"] as? String,
            let rating = dict["rating"] as? Double else {
                print("RETURNING NIL")
                return nil
           }
        
        validPost = Post(rating: rating, caption: caption, data: data)
        
        return validPost
    }
}
