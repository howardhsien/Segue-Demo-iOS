//
//  ViewController.swift
//  segueTest
//
//  Created by howard hsien on 2016/6/12.
//  Copyright © 2016年 AppWorks School Hsien. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIPopoverPresentationControllerDelegate{


    
    

    @IBAction func showAction(sender: AnyObject) {
        if let secondVC = storyboard?.instantiateViewControllerWithIdentifier("secondViewController")
        {
            navigationController?.showViewController(secondVC, sender: self)
        }
    
    }
    
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue)
    {
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    
    //custom segue is set false to demo
    //comment this out to validate customSegue
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "customSegue"
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //segue for the popover configuration window
        if segue.identifier == "popoverSegue" || segue.identifier == "popoverSegue2"{
            print("popoverSegue")
            if let controller = segue.destinationViewController as? UIViewController {
                controller.popoverPresentationController!.delegate = self
                controller.preferredContentSize = CGSize(width: 320, height: 186)
            }
        
        }
    }
}

