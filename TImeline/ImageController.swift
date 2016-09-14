//
//  ImageController.swift
//  TImeline
//
//  Created by Chandi Abey  on 9/10/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation
import UIKit

class ImageController {

static let baseURL = NSURL(string: "")
    
static func imageForURL(imageEndpoint: String, completion: ((image: UIImage?) -> Void)) {
    
    let endpoint = baseURL?.URLByAppendingPathComponent("\(imageEndpoint)").URLByAppendingPathExtension("json")
    
    guard let url = endpoint else { fatalError("Image URL optional is nil") }
    
    NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
        
        guard let data = data else { completion(image: nil); return }
        
        dispatch_async(dispatch_get_main_queue(), {
            completion(image: UIImage(data: data))
        })
        
        }
    }
}