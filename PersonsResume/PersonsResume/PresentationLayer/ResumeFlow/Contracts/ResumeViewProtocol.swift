//
//  ResumeViewProtocol.swift
//  PersonsResume
//
//  Created by . on 2023-09-01.
//

import Foundation
import UIKit

protocol ResumeViewProtocol: UIView {
    func didLoad()
    func reloadData()
    func buttonChange(image: UIImage?)
    func deleteItemsInCollectionView(indexPath: IndexPath)
    var collectionForCell: UICollectionView { get }
}
