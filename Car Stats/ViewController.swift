//
//  ViewController.swift
//  Car Stats
//
//  Created by Mirko Cukich on 7/11/19.
//  Copyright © 2019 Digital Mirko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // vehicle image
    @IBOutlet weak var imageView: UIImageView!
    // vehicle name
    @IBOutlet weak var nameLabel: UILabel!
    // brake horse power
    @IBOutlet weak var bhpLabel: UILabel!
    // 0-60 in seconds
    @IBOutlet weak var zeroToSixtyLabel: UILabel!
    // top speed in mph
    @IBOutlet weak var topSpeedLabel: UILabel!
    // miles per gallon - mpg
    @IBOutlet weak var milesPerGallonLabel: UILabel!
    // vehicle cost
    @IBOutlet weak var priceLabel: UILabel!
    // var to call and hold info
    var items = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get plist to load up with view
        self.items = loadPlist()
        // calls up a random vehicle to be selected
        randomCarButton(self)
        
    }
    
    // load plist function
    func loadPlist() -> [[String:String]] {
        // plist path with plist name and type - plist
        let path = Bundle.main.path(forResource: "carList", ofType: "plist")
        // calling our array with dictionary's in it and the key value pairs
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
        
    }
    
    // Random Car Picker Button
    @IBAction func randomCarButton(_ sender: Any) {
        
        // selects a random vehicle from our list, with optional wraps
        let dataSelect = items.randomElement()!
        // image loads up, with optional wraps
        imageView.image = UIImage(named: dataSelect["Image"]!)
        // calls up vehicles name
        nameLabel.text = dataSelect["Name"]
        // calls top speed label with optional wrap
        topSpeedLabel.text = "Top Speed: \(dataSelect["Top Speed"]!) mph"
        // calls up 0 - 60 label with optional wrap
        zeroToSixtyLabel.text = "0-60: \(dataSelect["0-60"]!) seconds"
        // calls up brake horse power with optional wrap
        bhpLabel.text = "BHP: \(dataSelect["BHP"]!)"
        // calls up miles per gallon with optional wrap
        milesPerGallonLabel.text = "MPG: \(dataSelect["MPG"]!)"
        // calls up the vehicle price with optional wrap
        priceLabel.text = "Price: \(dataSelect["Price"]!)"

    }
    
}
