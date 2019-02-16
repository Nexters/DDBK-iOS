//
//  ViewController.swift
//  team2z
//
//  Created by 김대섭 on 2019. 1. 20..
//  Copyright © 2019년 TeamNexters. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /* AF.request("https://httpbin.org/image/png").responseImage { response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
            }
        } */
        
        var testURL : String = "https://jsonplaceholder.typicode.com/todos/1"
        AF.request(testURL)
            .responseJSON { response in
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    print("Error: \(response.result.error)")
                    return
                }
                print(json)
        }
    }
}

