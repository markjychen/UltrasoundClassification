//
//  ProfileSelectionViewController.swift
//  UltrasoundClassification
//
//  Created by Mark Chen on 10/31/16.
//  Copyright © 2016 Mark Chen. All rights reserved.
//

import UIKit

class ProfileSelectionViewController: UIViewController, MakeNewProfileViewControllerDelegate {

    @IBOutlet weak var colorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func myVCDidFinish(controller: MakeNewProfileViewController, text: String){
        colorLabel.text = "The Color is " + text
        controller.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destination as! MakeNewProfileViewController
            vc.colorString = colorLabel.text!
            vc.delegate = self
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
