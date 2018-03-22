//
//  WorkportalViewController.swift
//  Workportal_jm_002
//
//  Created by Juan Manuel Moreno on 21/3/18.
//  Copyright © 2018 uzupis. All rights reserved.
//

import UIKit
import LUExpandableTableView

class WorkportalViewController: UIViewController {
    // MARK: - Properties
    
    private let expandableTableView = LUExpandableTableView()
    
    private let cellReuseIdentifier = "MyCell"
    private let sectionHeaderReuseIdentifier = "MySectionHeader"

    // MARK: - ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(expandableTableView)
        
        expandableTableView.register(WorkportalTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        expandableTableView.register(UINib(nibName: "MyExpandableTableViewSectionHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: sectionHeaderReuseIdentifier)
        
        expandableTableView.expandableTableViewDataSource = self as! LUExpandableTableViewDataSource
        expandableTableView.expandableTableViewDelegate = self as! LUExpandableTableViewDelegate
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        expandableTableView.frame = view.bounds
        expandableTableView.frame.origin.y += 20
    }
}

// MARK: - LUExpandableTableViewDataSource

extension WorkportalViewController: LUExpandableTableViewDataSource {
    func numberOfSections(in expandableTableView: LUExpandableTableView) -> Int {
        return 42
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = expandableTableView.dequeueReusableCell(withIdentifier: "MyCell") as? WorkportalTableViewCell else {
            assertionFailure("Cell shouldn't be nil")
            return UITableViewCell()
        }
        
        cell.label.text = "Cell at row \(indexPath.row) section \(indexPath.section)"
        
        return cell
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, sectionHeaderOfSection section: Int) -> LUExpandableTableViewSectionHeader {
        guard let sectionHeader = expandableTableView.dequeueReusableHeaderFooterView(withIdentifier: "MySectionHeader") as? MyExpandableTableViewSectionHeader else {
            assertionFailure("Section header shouldn't be nil")
            return LUExpandableTableViewSectionHeader()
        }

        sectionHeader.label.text = "Section \(section)"

        return sectionHeader
    }
}

// MARK: - LUExpandableTableViewDelegate

extension WorkportalViewController: LUExpandableTableViewDelegate {
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /// Returning `UITableViewAutomaticDimension` value on iOS 9 will cause reloading all cells due to an iOS 9 bug with automatic dimensions
        return 50
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, heightForHeaderInSection section: Int) -> CGFloat {
        /// Returning `UITableViewAutomaticDimension` value on iOS 9 will cause reloading all cells due to an iOS 9 bug with automatic dimensions
        return 69
    }
    
    // MARK: - Optional
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, didSelectRowAt indexPath: IndexPath) {
        print("Did select cell at section \(indexPath.section) row \(indexPath.row)")
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, didSelectSectionHeader sectionHeader: LUExpandableTableViewSectionHeader, atSection section: Int) {
        print("Did select section header at section \(section)")
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Will display cell at section \(indexPath.section) row \(indexPath.row)")
    }
    
    func expandableTableView(_ expandableTableView: LUExpandableTableView, willDisplaySectionHeader sectionHeader: LUExpandableTableViewSectionHeader, forSection section: Int) {
        print("Will display section header for section \(section)")
    }
}
