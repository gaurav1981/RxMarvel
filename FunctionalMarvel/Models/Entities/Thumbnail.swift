//
//  Thumbnail.swift
//  FunctionalMarvel
//
//  Created by Segii Shulga on 10/7/15.
//  Copyright © 2015 Sergey Shulga. All rights reserved.
//

import Foundation
import Argo
import Curry

enum ThumbnailType: String {
   
 /*portrait_small	50x75px
   portrait_medium	100x150px
   portrait_xlarge	150x225px
   portrait_fantastic	168x252px
   portrait_uncanny	300x450px
   portrait_incredible	216x324px*/
   
   case PortraitSmall = "portrait_small"
   case PortraitMedium = "portrait_medium"
   case PortraitXlarge = "portrait_xlarge"
   case PortraitFantastic = "portrait_fantastic"
   case PortraitUncanny = "portrait_uncanny"
   case PortraitIncredible = "portrait_incredible"
}

struct Thumbnail {
   let path: String
   let pathExtension: String
   
   func pathForType(type: ThumbnailType) -> String {
      return path + "/" + type.rawValue + "." + pathExtension
   }
}

extension Thumbnail:Decodable {
   static func decode(j: JSON) -> Decoded<Thumbnail> {
      return curry(Thumbnail.init)
         <^> j <| "path"
         <*> j <| "extension"
   }
}
