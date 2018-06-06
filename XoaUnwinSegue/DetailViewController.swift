//
//  ViewController.swift
//  XoaUnwinSegue
//
//  Created by dohien on 5/21/18.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    
    var number: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if number != nil {
            nameTextField.text  = number
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard nameTextField.text != "" else {return}
           number  = nameTextField.text
        
    }

}

