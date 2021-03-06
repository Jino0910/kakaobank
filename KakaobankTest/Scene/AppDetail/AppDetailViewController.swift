//
//  AppDetailViewController.swift
//  KakaobankTest
//
//  Created by rowkaxl on 06/05/2019.
//  Copyright (c) 2019 rowkaxl. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SwiftyJSON
import SafariServices

protocol AppDetailDisplayLogic: class {
    func displaySectionModels(viewModel: AppDetail.AppDetailInfo.ViewModel)
}

class AppDetailViewController: UIViewController, AppDetailDisplayLogic {
    var interactor: AppDetailBusinessLogic?
    var router: (NSObjectProtocol & AppDetailRoutingLogic & AppDetailDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = AppDetailInteractor()
        let presenter = AppDetailPresenter()
        let router = AppDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        interactor?.doSectionModels()
    }
    
    // MARK: Do something
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var cv: UICollectionView! {
        didSet {
            let flowLayout: UICollectionViewFlowLayout! = UICollectionViewFlowLayout()
            flowLayout.sectionHeadersPinToVisibleBounds = true
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 0
            
            cv.collectionViewLayout = flowLayout
            cv.showsVerticalScrollIndicator = false
            cv.showsHorizontalScrollIndicator = false
        }
    }
    
    var dataSource: RxCollectionViewSectionedReloadDataSource<AppSearchBaseItemSection>?
 
    public let sectionModels = BehaviorRelay<[AppSearchBaseItemSection]>(value: [])
    
    var screenShotHeight: CGFloat = 450 // 스크린샷 최초 높이 사이즈
    
    func displaySectionModels(viewModel: AppDetail.AppDetailInfo.ViewModel) {
        sectionModels.accept(viewModel.sectionModels)
    }
}

extension AppDetailViewController: UITableViewDelegate {
    
    private func configure() {
        configureUI()
        configureRx()
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.shadowImage = UIColor.white.as1ptImage()
        
        cv.rx.setDelegate(self).disposed(by: self.disposeBag)
        
        guard let model = self.router?.dataStore?.appInfoModel else { return }
        
        let imageView = UIImageView(frame: .zero)
        imageView.layer.borderColor = UIColor.borderColor.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        imageView.rx_asyncImageLoad(url: model.artworkUrl512, cachedName: model.artworkUrl512)
            .subscribe(onSuccess: { [weak self] (iv, image) in
                guard let self = self else { return }
                imageView.image = image?.resizeImage(targetSize: CGSize(width: 30, height: 30))
                self.navigationItem.titleView = imageView
                self.navigationItem.titleView?.alpha = 0.0
            })
            .disposed(by: disposeBag)
    }
    
    private func configureRx() {
        
        dataSource = RxCollectionViewSectionedReloadDataSource<AppSearchBaseItemSection>(
            configureCell: { (_, cv, indexPath, item) -> UICollectionViewCell in
                
                switch item.type {
                case .detailHeader:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailHeaderCell", for: indexPath) as! AppDetailHeaderCell
                    if let model = item.object as? AppInfoModel {
                        cell.configure(model: model)
                    }
                    return cell
                case .detailSubHeader:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailSubHeaderCell", for: indexPath) as! AppDetailSubHeaderCell
                    if let model = item.object as? AppInfoModel {
                        cell.configure(model: model)
                    }
                    return cell
                case .detailScreenShot:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailScreenShotCell", for: indexPath) as! AppDetailScreenShotCell
                    if let model = item.object as? AppInfoModel {
                        cell.configure(model: model)
                    }
                    cell.handler = { [weak self] height in
                        self?.screenShotHeight = height
                        cv.performBatchUpdates({})
                    }
                    return cell
                case .detailDescription:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailDescriptionCell", for: indexPath) as! AppDetailDescriptionCell
                    if let model = item.object as? AppInfoModel {
                        cell.configure(model: model)
                    }
                    cell.handler = { cv.performBatchUpdates({}) }
                    return cell
                case .detailDeveloperInfo:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailDeveloperInfoCell", for: indexPath) as! AppDetailDeveloperInfoCell
                    if let model = item.object as? AppInfoModel {
                        cell.configure(model: model)
                    }
                    return cell
                case .detailRating:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailRatingCell", for: indexPath) as! AppDetailRatingCell
                    if let model = item.object as? AppInfoModel {
                        cell.configure(model: model)
                    }
                    cell.reviewsButton.rx.tap
                        .subscribe(onNext: { (_) in
                            print("리뷰 모두 보기")
                        })
                        .disposed(by: self.disposeBag)
                    return cell
                case .detailReviews:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailReviewsCell", for: indexPath) as! AppDetailReviewsCell
                    return cell
                case .detailNewFeatureVersion:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailNewFeatureVersionCell", for: indexPath) as! AppDetailNewFeatureVersionCell
                    if let model = item.object as? AppInfoModel {
                        cell.configure(model: model)
                    }
                    cell.versionHistoryButton.rx.tap
                        .subscribe(onNext: { (_) in
                            print("버전 기록 보기")
                        })
                        .disposed(by: self.disposeBag)
                    return cell
                case .detailNewFeatureDescription:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailNewFeatureDescriptionCell", for: indexPath) as! AppDetailNewFeatureDescriptionCell
                    if let model = item.object as? AppInfoModel {
                        cell.configure(model: model)
                    }
                    cell.handler = { cv.performBatchUpdates({}) }
                    return cell
                case .detailInformationTitle:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailInformationTitleCell", for: indexPath) as! AppDetailInformationTitleCell
                    return cell
                case .detailInformationContent:
                    let cell = cv.dequeueReusableCell(withReuseIdentifier: "AppDetailInformationContentCell", for: indexPath) as! AppDetailInformationContentCell
                    if let dic = item.object as? Dictionary<String, Any> {
                        if let model = dic["model"] as? AppInfoModel, let type = dic["type"] as? AppDetailInformationContent {
                            cell.configure(model: model, type: type)
                        }
                    }
                    cell.handler = { cv.performBatchUpdates({}) }
                    return cell
                    
                default: return UICollectionViewCell()
                }
        })
        
        if let dataSource = dataSource {
            sectionModels.bind(to: cv.rx.items(dataSource: dataSource)).disposed(by: self.disposeBag)
        }
    
        cv.rx.itemSelected
            .subscribe(onNext: { [weak self] (indexPath) in
                guard let self = self else { return }
                guard let model = self.router?.dataStore?.appInfoModel else { return }
                
                if (self.cv.cellForItem(at: indexPath) as? AppDetailDeveloperInfoCell) != nil {

                    //  앱 상세 개발자 웹사이트
                    guard let url = URL(string: model.artistViewUrl) else { return }
                    let vc = SFSafariViewController(url: url)
                    self.present(vc, animated: true, completion: {})
                } else if let cell = self.cv.cellForItem(at: indexPath) as? AppDetailInformationContentCell {
                    
                    //  추가 정보내 개발자 웹 사이트
                    guard let type = cell.type else { return }
                    if type == .developerWebsite {
                        guard let url = URL(string: model.artistViewUrl) else { return }
                        let vc = SFSafariViewController(url: url)
                        self.present(vc, animated: true, completion: {})
                    }
                }
            })
            .disposed(by: disposeBag)
        
    }
}

extension AppDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let dataSource = dataSource else { return .zero }
        guard let model = self.router?.dataStore?.appInfoModel else { return .zero }
        
        let section = dataSource[indexPath.section]
        let item = section.items[indexPath.item]
        
        let width = UIScreen.main.bounds.width
        
        print(item.type)
        
        switch item.type {
            
        case .detailHeader: return CGSize(width: width, height: AppDetailHeaderCell.cellHeight)
        case .detailSubHeader: return CGSize(width: width, height: AppDetailSubHeaderCell.cellHeight)
        case .detailScreenShot: return CGSize(width: width, height: AppDetailScreenShotCell.bottomMargin+screenShotHeight)
        case .detailDescription:
            if let cell = cv.cellForItem(at: indexPath) as? AppDetailDescriptionCell {
                return CGSize(width: width, height: cell.cellHeight(width: width, desc: model.description))
            } else {
                return CGSize(width: width, height: AppDetailDescriptionCell.cellHeight())
            }
        case .detailDeveloperInfo: return CGSize(width: width, height: AppDetailDeveloperInfoCell.cellHeight)
        case .detailRating: return CGSize(width: width, height: AppDetailRatingCell.cellHeight)
        case .detailReviews: return CGSize(width: width, height: AppDetailReviewsCell.cellHeight)
        case .detailNewFeatureVersion: return CGSize(width: width, height: AppDetailNewFeatureVersionCell.cellHeight)
        case .detailNewFeatureDescription:
            if let cell = cv.cellForItem(at: indexPath) as? AppDetailNewFeatureDescriptionCell {
                return CGSize(width: width, height: cell.cellHeight(width: width, desc: model.releaseNotes))
            } else {
                return CGSize(width: width, height: AppDetailNewFeatureDescriptionCell.cellHeight)
            }
        case .detailInformationTitle: return CGSize(width: width, height: AppDetailInformationTitleCell.cellHeight)
        case .detailInformationContent: return CGSize(width: width, height: AppDetailInformationContentCell.cellHeight)
//            if let cell = cv.cellForItem(at: indexPath) as? AppDetailInformationContentCell {
//                guard let cellType = cell.type else { return .zero }
//                let content = model.informationContent(type: cellType)
//                return CGSize(width: width, height: cell.cellHeight(width: width, desc: content))
//            } else {
//                return CGSize(width: width, height: AppDetailInformationContentCell.cellHeight())
//            }
        default: return .zero
        }
    }
}

extension AppDetailViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            // navigationItem fade in
            UIView.animate(withDuration: 0.3) { self.navigationItem.titleView?.alpha = 1.0 }
        } else {
            // navigationItem fade out
            UIView.animate(withDuration: 0.3) { self.navigationItem.titleView?.alpha = 0.0 }
        }
    }
}

