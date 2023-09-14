//
//  ResumeViewControllerDelegate.swift
//  PersonsResume
//
//  Created by . on 2023-09-01.
//

import Foundation
import UIKit

protocol ResumeViewControllerDelegate: AnyObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func editDidTap()
}
