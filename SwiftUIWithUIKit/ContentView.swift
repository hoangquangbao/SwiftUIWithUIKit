//
//  ContentView.swift
//  SwiftUIWithUIKit
//
//  Created by Bao Hoang on 29/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    @State private var isShowSheet: Bool = false
    @State var uiImage: UIImage? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Input here", text: $text)
                .padding()
                .frame(height: 55)
                .background {
                    Color.green.cornerRadius(10)
                }
            
            BasicUIViewRepresentable()
                .padding()
                .frame(height: 55)
                .background {
                    Color.green.cornerRadius(10)
                }
            
            Button {
                isShowSheet.toggle()
            } label: {
                Text("Click here to open a sheet")
            }
            .sheet(isPresented: $isShowSheet) {
                //                BasicUIViewControllerRepresentable(lableText: "BasicUIViewControllerRepresentable")
                //                    .edgesIgnoringSafeArea(.bottom)
                
                UIImagePickerControllerRepresentable(uiImage: $uiImage)
            }
            
            if let uiImage = uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// UIKit
struct BasicUIViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Input here"
        
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
