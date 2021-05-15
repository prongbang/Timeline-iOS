//
//  BottomAppBar.swift
//  Timeline
//
//  Created by Endtry on 7/5/2564 BE.
//

//import SwiftUI
//import MaterialComponents
//
//struct UIBottomAppBarView: UIViewRepresentable {
//     func makeUIView(context: Context) -> MDCBottomAppBarView {
//        let bar = MDCBottomAppBarView()
//        bar.barTintColor = UIColor(named: "background")
//        
//        let buttonImage = UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)
//        bar.floatingButton.setImage(buttonImage, for: .normal)
//        bar.floatingButton.backgroundColor = UIColor(named: "secondary")
//        bar.floatingButton.tintColor = UIColor(named: "onSecondary")!
//        bar.floatingButton.addTarget(
//            context.coordinator,
//            action: #selector(Coordinator.onFloatingButtonCkick),
//            for: .touchUpInside
//        )
//        
//        bar.leadingBarButtonItems = [UIBarButtonItem(
//            image: UIImage(systemName: "line.horizontal.3")?.withRenderingMode(.alwaysTemplate),
//            style: .done,
//            target: context.coordinator,
//            action: #selector(Coordinator.onNavigationClick)
//        )]
//        return bar
//    }
//    
//    func updateUIView(_ uiView: MDCBottomAppBarView, context: Context) {
//        // nothing
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: NSObject {
//        var parent: UIBottomAppBarView
//        
//        init(_ bottomAppBar: UIBottomAppBarView) {
//            parent = bottomAppBar
//        }
//        
//        @objc func onNavigationClick() {
//            print("onNavigationClick")
//        }
//        
//        @objc func onFloatingButtonCkick() {
//             print("onFloatingButtonCkick")
//        }
//    }
//}
