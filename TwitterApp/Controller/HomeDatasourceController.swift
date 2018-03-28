//
//  HomeDatasourceController.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 22.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

class HomeDatasourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setupNavigationBarItems()
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, error) in
            if let error = error {
                self.errorMessageLabel.isHidden = false
                if let apiError = error as? APIError<JSONError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
            }
                
            self.datasource = homeDatasource
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            guard let user = datasource?.item(indexPath) as? User else {return .zero}
                let estimatedHeight = estimatedHeightForText(user.bioText)
                return CGSize(width: view.frame.width, height: estimatedHeight + 66)
                // 66 = namaLabel + usenameLabel + constraint + a little increase
        } else if indexPath.section == 1 {
            guard let tweet = datasource?.item(indexPath) as? Tweet else {return .zero}
            let estimatedHeight = estimatedHeightForText(tweet.message)
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }

        return CGSize(width: view.frame.width, height: 200)
    }
    
    private func estimatedHeightForText(_ text: String) -> CGFloat {
        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
        let options = NSStringDrawingOptions.usesLineFragmentOrigin
        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: options, attributes: attributes, context: nil)
        return estimatedFrame.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
}











