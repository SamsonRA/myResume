//
//  ResumeView.swift
//  PersonsResume
//
//  Created by . on 2023-09-01.
//

import Foundation
import UIKit
import SnapKit

final class ResumeView: UIView {

    weak var delegate: ResumeViewControllerDelegate?

    private let scrollView = UIScrollView()
    private let scrollContainerView = UIView()
    private let topFillerView = UIView()
    private let topViewContainer = UIView()
    private let titleLabel = UILabel()
    private let avatarImageView = UIImageView()
    private let editButton = UIButton()
    private let fullNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let townLabel = UILabel()
    private let aboutMeLabel = UILabel()
    private let textMyDescription = UILabel()
    private let mySkillsLabel = UILabel()

    private let avatarSize = 150.0

    private let alignedFlowLayout = LeftAlignedCollectionViewFlowLayout()
    lazy var collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)

    private func setUpLayout() {
        let scrollContentGuide = scrollView.contentLayoutGuide
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.translatesAutoresizingMaskIntoConstraints = false
        topViewContainer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        townLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        textMyDescription.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        mySkillsLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        topFillerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(topFillerView)
        addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubview(topViewContainer)
        scrollContainerView.addSubview(aboutMeLabel)
        scrollContainerView.addSubview(textMyDescription)
        scrollContainerView.addSubview(collectionView)
        scrollContainerView.addSubview(mySkillsLabel)
        scrollContainerView.addSubview(editButton)
        topViewContainer.addSubview(titleLabel)
        topViewContainer.addSubview(avatarImageView)
        topViewContainer.addSubview(fullNameLabel)
        topViewContainer.addSubview(descriptionLabel)
        topViewContainer.addSubview(townLabel)
        
        //MARK:  Layouts
        
        scrollView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
            
            
        topFillerView.snp.makeConstraints { make in
                make.top.left.right.equalToSuperview()
                make.bottom.greaterThanOrEqualTo(scrollContainerView.snp_topMargin)
            }
        scrollContainerView.snp.makeConstraints { make in
                make.top.left.right.bottom.equalTo(scrollContentGuide)
                make.left.right.width.equalTo(scrollView)
            }
            
        topViewContainer.snp.makeConstraints { make in
                make.top.equalTo(scrollContainerView)
                make.bottom.equalTo(townLabel).offset(19)
                make.left.right.equalToSuperview()
            }
            
        titleLabel.snp.makeConstraints { make in
                make.top.equalTo(topViewContainer).offset(20)
                make.centerX.equalTo(topViewContainer)
            }
        avatarImageView.snp.makeConstraints { make in
                make.height.equalTo(avatarSize)
                make.left.right.equalTo(topViewContainer).inset(120)
                make.top.equalTo(titleLabel).offset(42)
            }
            
        fullNameLabel.snp.makeConstraints { make in
                make.left.right.equalTo(topViewContainer).inset(100)
                make.top.equalTo(avatarImageView.snp_bottomMargin).offset(16)
            }
            
        descriptionLabel.snp.makeConstraints { make in
                make.left.right.equalTo(topViewContainer).inset(30)
                make.top.equalTo(fullNameLabel.snp_bottomMargin).offset(12)
            }
            
        townLabel.snp.makeConstraints { make in
                make.top.equalTo(descriptionLabel.snp_bottomMargin).offset(12)
                make.leading.trailing.equalTo(topViewContainer).inset(30)
            }
        mySkillsLabel.snp.makeConstraints { make in
                make.top.equalTo(townLabel.snp_bottomMargin).offset(40)
                make.leading.equalToSuperview().inset(16)
            }
        editButton.snp.makeConstraints { make in
                make.trailing.equalToSuperview().inset(16)
                make.top.equalTo(townLabel.snp_bottomMargin).offset(40)
            }
        collectionView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(16)
                make.top.equalTo(mySkillsLabel.snp_bottomMargin).offset(30)
            }
        aboutMeLabel.snp.makeConstraints { make in
                make.top.equalTo(collectionView.snp_bottomMargin).offset(34)
                make.leading.equalTo(scrollContentGuide).inset(16)
            }
        textMyDescription.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(16)
                make.bottom.equalTo(scrollContainerView.snp_bottomMargin)
                make.top.equalTo(aboutMeLabel.snp_bottomMargin).offset(16)
            }
        }
        
        
    }
    private func setUpStyle() {

        let image = UIImage(named: "town")
        let attachment = NSTextAttachment()
        let attributedString = NSMutableAttributedString(string: "town".localized)

        backgroundColor = .white

        topViewContainer.backgroundColor = AppColorEnum.backgroundColor.color

        scrollView.frame = bounds
        scrollView.clipsToBounds = true
        scrollView.contentInsetAdjustmentBehavior = .always

        titleLabel.text = "profile".localized
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textAlignment = .center

        avatarImageView.image = UIImage(named: "avatar")
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = avatarSize / 2

        fullNameLabel.text = "name".localized
        fullNameLabel.numberOfLines = 0
        fullNameLabel.adjustsFontSizeToFitWidth = true
        fullNameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        fullNameLabel.textAlignment = .center

        descriptionLabel.text = "experience".localized
        descriptionLabel.textColor = AppColorEnum.descriptionTextColor.color
        descriptionLabel.numberOfLines = 2
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textAlignment = .center


        attachment.image = image
        attributedString.insert(NSAttributedString(attachment: attachment), at: 0)
        townLabel.attributedText = attributedString
        townLabel.textColor = AppColorEnum.descriptionTextColor.color
        townLabel.numberOfLines = 1
        townLabel.adjustsFontSizeToFitWidth = true
        townLabel.font = .systemFont(ofSize: 14, weight: .regular)
        townLabel.textAlignment = .center

        aboutMeLabel.text = "about".localized
        aboutMeLabel.textAlignment = .left
        aboutMeLabel.font = .systemFont(ofSize: 16, weight: .medium)

        textMyDescription.text = "about me".localized
        textMyDescription.textAlignment = .left
        textMyDescription.numberOfLines = 0
        textMyDescription.font = .systemFont(ofSize: 14, weight: .regular)

        collectionView.dataSource = delegate
        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.reuseIdentifier)
        collectionView.register(AddCell.self, forCellWithReuseIdentifier: AddCell.reuseIdentifier)

        alignedFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize

        mySkillsLabel.text = "my skills".localized
        mySkillsLabel.font = .systemFont(ofSize: 16, weight: .medium)

        scrollView.isScrollEnabled = true
        editButton.setImage(UIImage(named: "editButton"), for: .normal)

        topFillerView.backgroundColor = AppColorEnum.backgroundColor.color
    }

    private func setUp() {
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }

    @objc
    private func editButtonTapped() {
        delegate?.editDidTap()
    }
}

extension ResumeView: ResumeViewProtocol {
    var collectionForCell: UICollectionView {
        collectionView
    }

    func deleteItemsInCollectionView(indexPath: IndexPath) {
        collectionView.deleteItems(at: [indexPath])
    }

    func buttonChange(image: UIImage?) {
        editButton.setImage(image, for: .normal)
    }

    func reloadData() {
        collectionView.reloadData()
    }

    func didLoad() {
        setUpStyle()
        setUpLayout()
        setUp()
    }
}
