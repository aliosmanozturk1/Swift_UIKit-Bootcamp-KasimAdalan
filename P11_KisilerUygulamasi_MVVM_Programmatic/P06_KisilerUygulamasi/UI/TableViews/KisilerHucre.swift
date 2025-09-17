//
//  KisilerHucre.swift
//  P06_KisilerUygulamasi
//
//  Created by Ali Osman Öztürk on 9.09.2025.
//

import UIKit

class KisilerHucre: UITableViewCell {

    var labelKisiAd: UILabel!
    var labelKisiTel: UILabel!
    private var stackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        labelKisiAd = UILabel()
        labelKisiAd.translatesAutoresizingMaskIntoConstraints = false
        labelKisiAd.font = UIFont.systemFont(ofSize: 25)
        
        labelKisiTel = UILabel()
        labelKisiTel.translatesAutoresizingMaskIntoConstraints = false
        labelKisiTel.font = UIFont.systemFont(ofSize: 20)
        labelKisiTel.textColor = UIColor(white: 0.33, alpha: 1.0)
        
        stackView = UIStackView(arrangedSubviews: [labelKisiAd, labelKisiTel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        contentView.addSubview(stackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}

