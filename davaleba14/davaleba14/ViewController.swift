//
//  ViewController.swift
//  davaleba14
//
//  Created by Ucha Dzotsenidze on 5/4/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    let leftview: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .magenta
        
        return view
    }()
    
    var rightview: UIView = {
    
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    
    let botbutton: UIButton = {

        let b = UIButton()

        b.setTitle("bot", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(onbotclick), for: .touchUpInside)
        b.backgroundColor = .gray


        b.layer.cornerRadius = 10
        b.layer.borderColor = UIColor.red.cgColor
        b.layer.borderWidth = 1

        return b
    }()

    
    var topbutton: UIButton = {
        let b = UIButton()

        b.setTitle("top", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(ontopclick), for: .touchUpInside)
        b.backgroundColor = .gray


        b.layer.cornerRadius = 10
        b.layer.borderColor = UIColor.red.cgColor
        b.layer.borderWidth = 1

        return b
    }()
    
    var leftbuton: UIButton = {
        let b = UIButton()

        b.setTitle("lft", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(onleftclick), for: .touchUpInside)
        b.backgroundColor = .gray


        b.layer.cornerRadius = 10
        b.layer.borderColor = UIColor.red.cgColor
        b.layer.borderWidth = 1

        return b
        
        
    }()
    
    
    var rightbutton: UIButton = {
        let b = UIButton()

        b.setTitle("rgt", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(onrightclick), for: .touchUpInside)
        b.backgroundColor = .gray


        b.layer.cornerRadius = 10
        b.layer.borderColor = UIColor.red.cgColor
        b.layer.borderWidth = 1

        return b
        
        
    }()
    
    var firstfield: UITextField = {
        
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.placeholder = "height"
        
        t.layer.cornerRadius = 5
        t.layer.borderColor = UIColor.red.cgColor
        t.layer.borderWidth = 1
        
        return t
    }()
    
    var secondfield: UITextField = {
        
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.placeholder = "width"
        
        t.layer.cornerRadius = 5
        t.layer.borderColor = UIColor.red.cgColor
        t.layer.borderWidth = 1
        
        return t
    }()
    
    var enterbutton: UIButton = {
        let b = UIButton()

        b.setTitle("enter", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(onenterclick), for: .touchUpInside)
        b.backgroundColor = .gray


        b.layer.cornerRadius = 10
        b.layer.borderColor = UIColor.red.cgColor
        b.layer.borderWidth = 1

        return b
        
    }()

    
    
    var slider: UISlider = {
        let s = UISlider()
        
        s.translatesAutoresizingMaskIntoConstraints = false
        
        s.minimumValue = 1
        s.maximumValue = 100
        s.value = 40
        
        return s
    }()
    
    var tapview = UIView()
    
    @objc func firsttap(){
        tapview = leftview
        print(#function)
    }
    
    @objc func secondtap(){
        tapview = rightview
    }
    
    
    
    
    var botbutconst: NSLayoutConstraint!
    var spacingCount = 0
    
    
    
    override func loadView() {
        
        
        super.loadView()
        
        view.addSubview(leftview)
        view.addSubview(rightview)
        view.addSubview(botbutton)
        view.addSubview(topbutton)
        view.addSubview(leftbuton)
        view.addSubview(rightbutton)
        view.addSubview(firstfield)
        view.addSubview(secondfield)
        view.addSubview(enterbutton)
        view.addSubview(slider)
        
        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    leftview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                    leftview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -270),
                    leftview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
                    leftview.heightAnchor.constraint(equalToConstant: 100)
                ])
        
        
        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    rightview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 270),
                    rightview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
                    rightview.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
                    rightview.heightAnchor.constraint(equalToConstant: 100)
                ])
        
        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    botbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 180),
                    botbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -180),
                    botbutton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 650),
                    botbutton.heightAnchor.constraint(equalToConstant: 50)
                ])
        

        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    topbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 180),
                    topbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -180),
                    topbutton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 450),
                    topbutton.heightAnchor.constraint(equalToConstant: 50)
                ])
        
        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    leftbuton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
                    leftbuton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -300),
                    leftbuton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 550),
                    leftbuton.heightAnchor.constraint(equalToConstant: 50)
                ])
        
        
        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    rightbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 300),
                    rightbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70),
                    rightbutton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 550),
                    rightbutton.heightAnchor.constraint(equalToConstant: 50)
                ])
        
        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    firstfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                    firstfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -290),
                    firstfield.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350),
                    firstfield.heightAnchor.constraint(equalToConstant: 30)
                ])
        
        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    secondfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 150),
                    secondfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -190),
                    secondfield.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350),
                    secondfield.heightAnchor.constraint(equalToConstant: 30)
                ])
        
        NSLayoutConstraint.activate([
        //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                    enterbutton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 280),
                    enterbutton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
                    enterbutton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350),
                    enterbutton.heightAnchor.constraint(equalToConstant: 30)
                ])
        
        NSLayoutConstraint.activate([
               //            redView.topAnchor.constraint(equalTo: greenView.bottomAnchor),
                           slider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                           slider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
                           slider.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 800),
                           slider.heightAnchor.constraint(equalToConstant: 50)
                       ])
        
        leftview.isUserInteractionEnabled = true
        rightview.isUserInteractionEnabled = true
        
        let viewgsetureleft = UITapGestureRecognizer(target: self, action: #selector(self.firsttap))
        let viewgsetureright = UITapGestureRecognizer(target: self, action: #selector(self.secondtap))
        
        leftview.addGestureRecognizer(viewgsetureleft)
        rightview.addGestureRecognizer(viewgsetureright)
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        botbutconst = NSLayoutConstraint(item: leftview, attribute: .top, relatedBy: .equal, toItem: .none, attribute: .bottom, multiplier: 1, constant: 0)
//        self.view.addConstraint(botbutconst)
        
    }
    
    @objc func onbotclick(){
     
        
        botbutconst.constant = CGFloat(spacingCount)
        spacingCount += 10
    }
    
    
    @objc func ontopclick(){
     
    
    }
    
    
    @objc func onrightclick(){
        
       
       }
    
    @objc func onleftclick(){
        
       
       }
    
    @objc func onenterclick(){
        
        firstfield.text = ""
        secondfield.text = ""
    
    }
    
}

