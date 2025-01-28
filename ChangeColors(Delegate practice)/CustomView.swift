//
//  CustomView.swift
//  ChangeColors(Delegate practice)
//
//  Created by sunflow on 28/1/25.
//

import UIKit

protocol CustomViewDelegate: AnyObject {
    func didChangeColor(with color: UIColor)
}

class CustomView: UIView {
    
    weak var delegate: CustomViewDelegate?
    
    private let redButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Red", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let yellowButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Red", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let greenButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Red", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
}

extension CustomView {
    
    private func setupView() {
        addSubview(redButton)
        addSubview(yellowButton)
        addSubview(greenButton)
        
        setupConstraints()
        
        redButton.addTarget(self, action: #selector(redButtonTapped), for: .touchUpInside)
        yellowButton.addTarget(self, action: #selector(yellowButtonTapped), for: .touchUpInside)
        greenButton.addTarget(self, action: #selector(greenButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            redButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            redButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            redButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            redButton.heightAnchor.constraint(equalToConstant: 50),
            
            yellowButton.topAnchor.constraint(equalTo: redButton.bottomAnchor, constant: 10),
            yellowButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            yellowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            yellowButton.heightAnchor.constraint(equalToConstant: 50),
            
            greenButton.topAnchor.constraint(equalTo: yellowButton.bottomAnchor, constant: 10),
            greenButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            greenButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            greenButton.heightAnchor.constraint(equalToConstant: 50),
            greenButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        
        ])
            
            }
    
    @objc private func redButtonTapped() {
        delegate?.didChangeColor(with: .red)
    }

    @objc private func yellowButtonTapped() {
        delegate?.didChangeColor(with: .yellow)
    }

    @objc private func greenButtonTapped() {
        delegate?.didChangeColor(with: .green)
    }
}
