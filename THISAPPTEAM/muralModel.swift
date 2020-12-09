//
//  Mural.swift
//  THISAPPTEAM
//
//  Created by William Keeley on 12/8/20.
//

import Foundation

public struct muralDataModel
{
    let title: NSString
    let artist: NSString
    let latitude: Double
    let longitude: Double
    let imageRef: NSString
    
    
    public init?(title: NSString, artist: NSString, latitude: Double, longitude: Double, imageRef: NSString)
    {
       
        
        self.title = title
        self.artist = artist
        self.latitude = latitude
        self.longitude = longitude
        self.imageRef = imageRef
    }
 
 
}
