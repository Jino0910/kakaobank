//
//  ViewController.swift
//  KakaobankTest
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.request(target: .searchAppStore(query: "카카오뱅크"))
            .filter {$0.0 == .code200}
            .subscribe(onSuccess: { (_, json) in
                print(json)
            })
            .disposed(by: disposeBag)
    }
}

