//
//  ViewController.swift
//  scraping-sb
//
//  Created by miguel tomairo on 5/11/20.
//  Copyright © 2020 Rapser. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url =
        //"https://www.apple.com/la/apple-music"
        "https://elcomercio.pe"
        //"https://itunes.apple.com/search?term=thepolice"
        configure(url)
    }

    func configure(_ html: String) {
        
        let url = URL(string: html)
        let urlRequest = URLRequest(url: url!)
        
        AF.request(urlRequest).responseString { (data) in
            
            self.parseHTML(data.value!)
            
            print(data.value!)
            
        }
        
    }
    
    func parseHTML(_ contenido: String) {
                
        do {
            
            let doc = try Kanna.HTML(html: contenido, encoding: .utf8)
            print("HTML: \(doc)")
            
        }catch {
            print(error.localizedDescription)
        }

    }
    
    

}

