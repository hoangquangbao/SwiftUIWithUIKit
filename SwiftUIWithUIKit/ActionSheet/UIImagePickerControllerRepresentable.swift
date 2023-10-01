//
//  UIImagePickerControllerRepresentable.swift
//  SwiftUIWithUIKit
//
//  Created by Bao Hoang on 01/10/2023.
//

import SwiftUI

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var uiImage: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let vc = UIImagePickerController()
        vc.delegate = context.coordinator
        return vc
    }
    
    // from SwiftUI to UIKit
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    // from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(uiImage: $uiImage)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @Binding var uiImage: UIImage?

    init(uiImage: Binding<UIImage?>) {
        self._uiImage = uiImage
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let newImage = info[.originalImage] as? UIImage else
        {
            print("DEBUGG: get image faild")
            return
        }
        uiImage = newImage
                
        print("DEBUGG: get image successfully")
        picker.dismiss(animated: true)
    }
}
