//
//  BasicUIViewControllerRepresentable.swift
//  SwiftUIWithUIKit
//
//  Created by Bao Hoang on 01/10/2023.
//

import SwiftUI

// UIKit
struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let lableText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        //        let vc = UIViewController()
        //        vc.view.backgroundColor = .purple
        //
        //        let lable = UILabel()
        //        lable.text = lableText
        //        lable.textColor = .white
        //        lable.textAlignment = .center
        //
        //        vc.view.addSubview(lable)
        //        lable.frame = vc.view.frame
        //
        //        return vc
        
        let vc = MyFirstUIViewController()
        vc.lableText = lableText
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class MyFirstUIViewController: UIViewController {
    
    var lableText: String = "UIViewControllerRepresentable"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        let lable = UILabel()
        lable.text = lableText
        lable.textColor = .white
        lable.textAlignment = .center
        
        view.addSubview(lable)
        lable.frame = view.frame
    }
}
