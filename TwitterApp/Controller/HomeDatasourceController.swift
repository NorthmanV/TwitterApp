//
//  HomeDatasourceController.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 22.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import LBTAComponents

class HomeDatasourceController: DatasourceController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}













