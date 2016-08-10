//
//  Post.swift
//  myHood
//
//  Created by Soroush Shahi on 8/8/16.
//  Copyright © 2016 Soroush. All rights reserved.
//

import Foundation


class Post: NSObject, NSCoding {
    private var _imagePath : String!
    private var _title : String!
    private var _postDesc : String!
    
    var imagePath : String {
        return _imagePath
    }
    
    var title : String {
        return _title
    }
    
    var postDesc : String {
        return _postDesc
    }
    
    init (imagePath: String , title: String , postDesc: String) {
        self._imagePath = imagePath
        self._title = title
        self._postDesc = postDesc
    }
    override init(){
    
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._imagePath = aDecoder.decodeObjectForKey("imagepath") as? String
        self._title = aDecoder.decodeObjectForKey("title") as? String
        self._postDesc = aDecoder.decodeObjectForKey("description") as? String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(_imagePath, forKey: "imagepath")
        aCoder.encodeObject(_title, forKey: "title")
        aCoder.encodeObject(_postDesc, forKey: "description")  
    }
    
    
    
    
}