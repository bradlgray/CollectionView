//
//  GetRequest.swift
//  IosInterview
//
//  Created by Brad Gray on 7/27/16.
//  Copyright © 2016 Brad Gray. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher


class GetRequest {
    
     private var _imageArray = [String]()
    

    
    var imageArray: [String] {
        return _imageArray
    }
    
    func downloadImages(complete: DownloadComplete) {
        
        
        
        Alamofire.request(.GET, PhotoUrl).responseJSON { response in
            switch response.result {
                case .Success:
                    if let result = response.result.value {
                        let json = JSON(result)

                        if let Photoitems = json["hits"].array {
                            for photo in Photoitems {
                                if let photoPreview = photo["previewURL"].string {

                                self._imageArray.append(photoPreview)
                               
                            }
                        }
                    }
                    
                    
}
            case .Failure(let error):
                print(error)
                
                
            }
            complete()
            

            }
            
         }
}
