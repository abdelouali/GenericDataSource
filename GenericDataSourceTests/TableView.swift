//
//  TableView.swift
//  GenericDataSource
//
//  Created by Mohamed Afifi on 3/27/16.
//  Copyright © 2016 mohamede1945. All rights reserved.
//

import UIKit
import GenericDataSource

class TableView: UITableView {
    
    func reset() {
        indexPath = nil
        identifier = nil
        section = nil
        cellClass = nil
        nib = nil
        called = false
        sectionsSet = nil
        animation = nil
        toSection = nil
        indexPaths = nil
        toIndexPath = nil
        scrollPosition = nil
        animated = nil
        cell = nil
        dequeCell = UITableViewCell()
        point = nil
        cells = []
    }

    var indexPath: NSIndexPath?
    var identifier: String?
    var section: Int?
    var called = false
    var sectionsSet: NSIndexSet?
    var animation: UITableViewRowAnimation?
    var indexPaths: [NSIndexPath]?
    var scrollPosition: UITableViewScrollPosition?
    var animated: Bool?
    var cell: UITableViewCell?

    var cellClass: AnyClass?
    override func registerClass(cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        self.cellClass = cellClass
        self.identifier = identifier
    }
    
    var nib: UINib?
    override func registerNib(nib: UINib?, forCellReuseIdentifier identifier: String) {
        self.nib = nib
        self.identifier = identifier
    }
    
    var dequeCell = UITableViewCell()
    override func dequeueReusableCellWithIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        self.identifier = identifier
        self.indexPath = indexPath

        return dequeCell
    }
    
    var sections: Int = 0
    override var numberOfSections: Int {
        return sections
    }
    
    var items: Int = 0
    override func numberOfRowsInSection(section: Int) -> Int {
        self.section = section
        return items
    }
    
    
    override func reloadData() {
        called = true
    }
    
    override func ds_performBatchUpdates(updates: (() -> Void)?, completion: ((Bool) -> Void)?) {
        called = true
    }

    override func insertSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        sectionsSet = sections
        self.animation = animation
    }
    
    override func deleteSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        sectionsSet = sections
        self.animation = animation
    }
    
    override func reloadSections(sections: NSIndexSet, withRowAnimation animation: UITableViewRowAnimation) {
        sectionsSet = sections
        self.animation = animation
    }
    
    var toSection: Int?
    override func moveSection(section: Int, toSection newSection: Int) {
        self.section = section
        toSection = newSection
    }
    
    override func insertRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        self.indexPaths = indexPaths
        self.animation = animation
    }

    override func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        self.indexPaths = indexPaths
        self.animation = animation
    }

    override func reloadRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
        self.indexPaths = indexPaths
        self.animation = animation
    }

    var toIndexPath: NSIndexPath?
    override func moveRowAtIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        self.indexPath = indexPath
        self.toIndexPath = newIndexPath
    }
    
    override func scrollToRowAtIndexPath(indexPath: NSIndexPath, atScrollPosition scrollPosition: UITableViewScrollPosition, animated: Bool) {
        self.indexPath = indexPath
        self.scrollPosition = scrollPosition
        self.animated = animated
    }
    
    override func selectRowAtIndexPath(indexPath: NSIndexPath?, animated: Bool, scrollPosition: UITableViewScrollPosition) {
        self.indexPath = indexPath
        self.animated = animated
        self.scrollPosition = scrollPosition
    }

    override func deselectRowAtIndexPath(indexPath: NSIndexPath, animated: Bool) {
        self.indexPath = indexPath
        self.animated = animated
    }

    override func indexPathForCell(cell: UITableViewCell) -> NSIndexPath? {
        self.cell = cell
        return indexPath
    }

    var point: CGPoint?
    override func indexPathForRowAtPoint(point: CGPoint) -> NSIndexPath? {
        self.point = point
        return indexPath
    }
    
    override var indexPathsForVisibleRows: [NSIndexPath]? {
        return indexPaths ?? []
    }
    
    override var indexPathsForSelectedRows: [NSIndexPath]? {
        return indexPaths ?? []
    }

    var cells: [UITableViewCell] = []
    override var visibleCells: [UITableViewCell] {
        return cells
    }

    override func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
        self.indexPath = indexPath
        return cell
    }
}
