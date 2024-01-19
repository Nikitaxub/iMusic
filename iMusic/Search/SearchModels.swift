//
//  SearchModels.swift
//  iMusic
//
//  Created by nik on 19.01.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
          case getTracks
      }
    }
    struct Response {
      enum ResponseType {
        case some
          case presentTracks
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
          case displayTracks
      }
    }
  }
  
}
