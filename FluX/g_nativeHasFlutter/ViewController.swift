//
//  ViewController.swift
//  iOS_do
//
//  Created by Jz D on 2022/7/4.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    lazy var engine: FlutterEngine = {
        let ee = FlutterEngine()
        ee.run()
        return ee
    }()
    
    lazy var vc = FlutterViewController(engine: engine, nibName: nil, bundle: nil)

    lazy var oneC: FlutterMethodChannel? = { () -> FlutterMethodChannel? in
        if let ctrl = vc as? FlutterBinaryMessenger{
            return FlutterMethodChannel(name: "XxOne", binaryMessenger: ctrl)
        }
        else{
            return nil
        }
    }()
    
    
    lazy var twoC: FlutterMethodChannel? = { () -> FlutterMethodChannel? in
        if let ctrl = vc as? FlutterBinaryMessenger{
            return FlutterMethodChannel(name: "XxTwo", binaryMessenger: ctrl)
        }
        else{
            return nil
        }
    }()
    
    
    lazy var stream: FlutterBasicMessageChannel? = {
        if let ctrl = vc as? FlutterBinaryMessenger{
            return FlutterBasicMessageChannel(name: "mmm", binaryMessenger: ctrl)
        }
        else{
            return nil
        }
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnOne = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        btnOne.backgroundColor = UIColor.red
        btnOne.addTarget(self, action: #selector(goOne), for: .touchUpInside)
        view.addSubview(btnOne)
        
        let btnTwo = UIButton(frame: CGRect(x: 200, y: 50, width: 100, height: 100))
        btnTwo.backgroundColor = UIColor.yellow
        btnTwo.addTarget(self, action: #selector(goTwo), for: .touchUpInside)
        view.addSubview(btnTwo)
        
        oneC?.setMethodCallHandler { call, result in
            print("222222");
            switch call.method{
            case "gg":
                self.vc.dismiss(animated: true){}
            ()
            default:()
            }
        }
        
        
        twoC?.setMethodCallHandler { call, result in
            print("222222");
            switch call.method{
            case "gg":
                self.vc.dismiss(animated: true){}
            ()
            default:()
            }
        }
        
        stream?.setMessageHandler { info, reply in
            if let content = info as? String{
                print("Native 收到了 _ ")
                print(content)
            }
        }
    }


    
    @objc func goOne(){
        oneC?.invokeMethod("show", arguments: nil)
        present(vc, animated: true) {
            
        }
    }
    
    
    @objc func goTwo(){
        print(twoC == nil)
        
        present(vc, animated: true) {
            self.twoC?.invokeMethod("show", arguments: nil)
        }
    }
}

