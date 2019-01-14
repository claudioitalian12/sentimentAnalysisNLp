//
//  ViewController.swift
//  sentimentAnalysisNLp
//
//  Created by claudio Cavalli on 14/01/2019.
//  Copyright © 2019 claudio Cavalli. All rights reserved.
//

import UIKit
import NaturalLanguage
class ViewController: UIViewController {
  
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      
    }


    
    @IBAction func Results(_ sender: Any) {
        
        if((textField.text?.isEmpty)!){
            return
        }
        
        else {
           
            setImage()
        }
        
    }
    
    func setImage(){
        
        let model = try! NLModel(contentsOf: TextClassifier.urlOfModelInThisBundle)
        
      let imageName =   model.predictedLabel(for:  textField.text!)!
   
        switch imageName {
        case "positive":
            image.image = UIImage(named: "positive")
        case "negative":
               image.image = UIImage(named: "negative")
        case "neutral":
               image.image = UIImage(named: "neutral")
        default:
            break
        }
        
    }
}

