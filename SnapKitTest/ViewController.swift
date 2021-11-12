//
//  ViewController.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 11.11.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let button  = Button(title: "0", color: .darkGray, textAlignment: .left).settingButton()
    let button2 = Button(title: ",", color: .darkGray, textAlignment: .left).settingButton()
    let button3 = Button(title: "=", color: .darkGray, textAlignment: .left).settingButton()
    
    lazy var stack: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [button, button2, button3])
        stack.distribution = .fill
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()
    
    let button5 = Button(title: "1", color: .darkGray, textAlignment: .center).settingButton()
    let button6 = Button(title: "2", color: .darkGray, textAlignment: .center).settingButton()
    let button7 = Button(title: "3", color: .darkGray, textAlignment: .center).settingButton()
    let button8 = Button(title: "+", color: .orange, textAlignment: .center).settingButton()

    lazy var stack2: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [button5, button6, button7, button8])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()
    
    let button9  = Button(title: "4", color: .darkGray, textAlignment: .center).settingButton()
    let button10 = Button(title: "5", color: .darkGray, textAlignment: .center).settingButton()
    let button11 = Button(title: "6", color: .darkGray, textAlignment: .center).settingButton()
    let button12 = Button(title: "-", color: .orange, textAlignment: .center).settingButton()
    
    lazy var stack3: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [button9, button10, button11, button12])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()
    
    
    lazy var mainStack: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [stack3, stack2, stack])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .vertical
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
        
        self.view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.right.left.equalTo(self.view).inset(10)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }
        
        mainStack.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.right.left.equalTo(mainStack)
            make.centerX.equalTo(mainStack)
            make.bottom.equalTo(mainStack.snp.bottom)
        }
        
        mainStack.addSubview(stack2)
        stack2.snp.makeConstraints { make in
            make.right.left.equalTo(mainStack)
            make.centerX.equalTo(mainStack)
        }
        
        mainStack.addSubview(stack3)
        stack3.snp.makeConstraints { make in
            make.right.left.equalTo(mainStack)
            make.centerX.equalTo(mainStack)
        }

        stack.addSubview(button)
        button.snp.makeConstraints { make in
            make.height.equalTo(self.button5.snp.width)
        }
        
        stack.addSubview(button2)
        button2.snp.makeConstraints { make in
            make.height.equalTo(self.button5.snp.width)
            make.width.equalTo(self.button2.snp.height)
        }
        
        stack.addSubview(button3)
        button3.snp.makeConstraints { make in
            make.height.equalTo(self.button5.snp.width)
            make.width.equalTo(self.button3.snp.height)
        }
        
        stack2.addSubview(button5)
        button5.snp.makeConstraints { make in
            make.height.equalTo(self.button5.snp.width)
        }
        
        stack2.addSubview(button6)
        button6.snp.makeConstraints { make in
            make.height.equalTo(self.button6.snp.width)
        }
        
        stack2.addSubview(button7)
        button7.snp.makeConstraints { make in
            make.height.equalTo(self.button7.snp.width)
        }
        
        stack2.addSubview(button8)
        button8.snp.makeConstraints { make in
            make.height.equalTo(self.button8.snp.width)
        }
        
        stack3.addSubview(button9)
        button9.snp.makeConstraints { make in
            make.height.equalTo(self.button9.snp.width)
        }
        
        stack3.addSubview(button10)
        button10.snp.makeConstraints { make in
            make.height.equalTo(self.button10.snp.width)
        }
        
        stack3.addSubview(button11)
        button11.snp.makeConstraints { make in
            make.height.equalTo(self.button11.snp.width)
        }
        
        stack3.addSubview(button12)
        button12.snp.makeConstraints { make in
            make.height.equalTo(self.button12.snp.width)
        }
    }
}

