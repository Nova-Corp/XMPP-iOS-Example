//
//  ViewController.swift
//  New_XMPP_Example
//
//  Created by ADMIN on 25/02/20.
//  Copyright © 2020 Success Resource Pte Ltd. All rights reserved.
//

import UIKit
import XMPPFramework

class ViewController: UIViewController {

    var stream:XMPPStream!
    
      override func viewDidLoad() {
        super.viewDidLoad()
    
        stream = XMPPStream()
        stream.addDelegate(self, delegateQueue: DispatchQueue.global())
      
        stream.myJID = XMPPJID(string: "shan@localhost")
        
        
        do {
            try stream.connect(withTimeout: 30)
            
        }
        catch {
            print("error occured in connecting")
        }
    }
    
    func xmppStreamWillConnect(sender: XMPPStream!) {
        print("will connect")
    }
    
    func xmppStreamConnectDidTimeout(_ sender: XMPPStream) {
        print("timeout:")
    }
    
    func xmppStreamDidConnect(sender: XMPPStream!) {
        print("connected")
        
        do {
            try sender.authenticate(withPassword: "12345")
        }
        catch let err {
            print("Error:\(err)")
            
        }

    }
    
    
    func xmppStreamDidAuthenticate(_ sender: XMPPStream) {
        print("auth done")
        sender.send(XMPPPresence())
    }
    

    func xmppStream(_ sender: XMPPStream, didNotAuthenticate error: DDXMLElement) {
        print("dint not auth")
        print(error)
    }

}

