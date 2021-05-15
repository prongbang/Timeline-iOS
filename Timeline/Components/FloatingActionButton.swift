//
//  FloatingActionButton.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

//import SwiftUI
//import MaterialComponents
//
//struct FloatingActionButton: UIViewRepresentable {
//    let title: String
//    let action: () -> Void
//
//    init(_ title: String, action: @escaping () -> Void) {
//        self.title = title
//        self.action = action
//    }
//
//    func makeUIView(context: Context) -> MDCFloatingButton {let button = MDCFloatingButton(shape: .default)
//        button.addTarget(context.coordinator, action: #selector(Coordinator.buttonTapped), for: .touchUpInside)
//        return MDCFloatingButton(shape: .default)
//    }
//
//    func updateUIView(_ uiView: MDCFloatingButton, context: Context) {
//        uiView.setTitle(title, for: .normal)
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(self)
//    }
//
//    class Coordinator: NSObject {
//        var button: FloatingActionButton
//
//        init(_ button: FloatingActionButton) {
//            self.button = button
//        }
//
//        @objc func buttonTapped() {
//            button.action()
//        }
//    }
//}
