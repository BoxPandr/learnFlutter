//
//  ViewController.swift
//  iOS_do
//
//  Created by Jz D on 2022/7/4.
//

import UIKit
import Flutter

class ViewController: UIViewController {


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
        
    }


    
    @objc func goOne(){

        let vc = FlutterViewController(project: nil, initialRoute: nil, nibName: nil, bundle: nil)
        present(vc, animated: true) {
            
        }
    }
    
    @objc func goTwo(){

        let vc = FlutterViewController(project: nil, initialRoute: "/Two", nibName: nil, bundle: nil)
        present(vc, animated: true) {
            
        }
    }
}

