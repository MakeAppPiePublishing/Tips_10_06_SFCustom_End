//
//  ViewController.swift
//  10_06_FSSymbol
//
//  Created by Steven Lipton on 2/8/20.
//  Copyright © 2020 Steven Lipton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var scale = UIImage.SymbolScale.medium
    var symbol = "pie.fill"
    var font = UIFont.TextStyle.body
    @IBOutlet weak var sfSymbol: UIImageView!
    @IBOutlet weak var label: UILabel!
    func updateImage(){
        label.text = symbol + " SF Symbol"
        label.font = UIFont.preferredFont(forTextStyle: font)
        let configuration = UIImage.SymbolConfiguration(textStyle: font, scale: scale)
        sfSymbol.preferredSymbolConfiguration  = configuration
    }
    
    @IBAction func sizeChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index{
        case 0:
            scale = .small
        case 1:
            scale = .medium
        case 2:
            scale = .large
        default:
            scale = .default
        }
        updateImage()
    }
    
    @IBAction func fontChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index{
        case 0:
            font = .body
        case 1:
            font = .headline
        case 2:
            font = .title1
        case 3:
            font = .largeTitle
        default:
            scale = .default
        }
        updateImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sfSymbol.image = UIImage(named: symbol)
        updateImage()
    }


}

