//
//  ViewController.swift
//  ChangeColors(Delegate practice)
//
//  Created by sunflow on 28/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    

    private let colorPickerView = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupColorPickerView()
        
        colorPickerView.delegate = self
        
        
    }
    
    private func setupColorPickerView() {
        colorPickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colorPickerView)
        
        NSLayoutConstraint.activate([
            colorPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorPickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            colorPickerView.widthAnchor.constraint(equalToConstant: 200),
            colorPickerView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        colorPickerView.backgroundColor = .lightGray
    }


}

extension ViewController: CustomViewDelegate {
    
    func didChangeColor(with color: UIColor) {
        view.backgroundColor = color
    }
}

