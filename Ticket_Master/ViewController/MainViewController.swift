//
//  ViewController.swift
//  Ticket_Master
//
//  Created by Sky on 10/3/19.
//  Copyright © 2019 Sky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var searchTableView: UITableView!

//    var viewModel = ViewModel() {
//        didSet {
//            self.searchTableView.reloadData()
//        }
//    }

    var viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHome()
        
    }
    
    func setupHome() {
        viewModel.getAttr()
        viewModel.attrDelegate = self
        searchTableView.register(UINib(nibName: AttractionTableCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: AttractionTableCell.identifier)
        
//        searchTableView.tableFooterView = UIView(frame: .zero)
    }


}

extension MainViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // TODO
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
        return 80
    }
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //TODO
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO
        return section == 0 ? 1 : viewModel.attrs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableCellOne.identifier, for: indexPath) as! SearchTableCellOne
            cell.searchCollectionView.reloadData()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: AttractionTableCell.identifier, for: indexPath) as! AttractionTableCell
            let attr = viewModel.attrs[indexPath.row]
            cell.attr = attr
            return cell
        }
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.attrs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionCell.identifier, for: indexPath) as! SearchCollectionCell
        //TODO
        let attr = viewModel.attrs[indexPath.row]
        cell.attr = attr
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 3.5
        return CGSize(width: width, height: width)
    }
}

extension MainViewController: AttrDelegate {
    func update() {
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
}
