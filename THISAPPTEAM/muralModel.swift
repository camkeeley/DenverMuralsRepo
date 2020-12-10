//
//  Mural.swift
//  THISAPPTEAM
//
//  Created by William Keeley on 12/8/20.
//

import Foundation

public struct muralDataModel
{
    var title: NSString
    var artist: NSString
    var latitude: Double
    var longitude: Double
    var imageRef: NSString
    
    
    public init?(title: NSString, artist: NSString, latitude: Double, longitude: Double, imageRef: NSString)
    {
       
        
        self.title = title
        self.artist = artist
        self.latitude = latitude
        self.longitude = longitude
        self.imageRef = imageRef
    }
 
 
}
