//
//  HomeViewController.swift
//  LearnAppKit
//
//  Created by Ckitakishi on 16/6/25.
//  Copyright © 2016年 Ckitakishi. All rights reserved.
//

import Cocoa

class HomeViewController: NSViewController {
    
    @IBOutlet weak var pathControl: NSPathControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func openDocument(sender: AnyObject?) {
        let openPanel = NSOpenPanel()
        
        openPanel.beginWithCompletionHandler({ (result) -> Void in
            if result == NSModalResponseOK {
                print(openPanel)
                for fileURL in openPanel.URLs {
                    if let filePath :String = fileURL.resourceSpecifier {
                        if let decodedPath :String = filePath.stringByRemovingPercentEncoding {
                            let url = NSURL(string: decodedPath)
                            self.pathControl.URL = url
                            
                            do {
                               let data = try String(
                                contentsOfFile: decodedPath,
                                encoding: NSUTF8StringEncoding)
                            } catch {
                                
                            }
                        }
                    }
                }
            } else if result == NSModalResponseCancel {
                
            }
        })
    }

}
