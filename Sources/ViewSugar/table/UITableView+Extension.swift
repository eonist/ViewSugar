#if os(iOS)
import UIKit

extension UITableViewDataSource where Self: UITableView {
    /**
     * Returns all cells in a table
     * ## Examples:
     * tableView.cells // array of cells in a tableview
     */
    public var cells: [UITableViewCell] {
        return (0..<self.numberOfSections).indices.map { (sectionIndex: Int) -> [UITableViewCell] in
            (0..<self.numberOfRows(inSection: sectionIndex)).indices.compactMap { (rowIndex: Int) -> UITableViewCell? in
                self.cellForRow(at: IndexPath(row: rowIndex, section: sectionIndex))
            }
        }.flatMap { $0 }
    }
    /**
     * Returns all IndexPath's in a table
     * ## Examples:
     * table.indexPaths.forEach {
     *    selectRow(at: $0, animated: true, scrollPosition: .none) // selects all cells
     * }
     */
    public var indexPaths: [IndexPath] {
        return (0..<self.numberOfSections).indices.map { (sectionIndex: Int) -> [IndexPath] in
            (0..<self.numberOfRows(inSection: sectionIndex)).indices.compactMap { (rowIndex: Int) -> IndexPath? in
                IndexPath(row: rowIndex, section: sectionIndex)
            }
        }.flatMap { $0 }
    }
    /**
     * Returns rowCount in table
     */
   var rowCount: Int {
      (0..<numberOfSections).indices.map { numberOfRows(inSection: $0) }.reduce(0, +)
   }
   /**
   * Returns a cells in table
   * - Note: Unlike native cell(for index) or visibleCells calls, this call wont break/complain even when called before the cells are available
   */
   var availableCells: [UITableViewCell] {
      self.subviews.compactMap { $0 as? UITableViewCell }
   }
   /**
   * Returns a cell in table for indexpath
   * - Note: Unlike native cell(for index) or visibleCells calls, this call wont break/complain even when called before the cells are available
   */
   func availableCell(indexPath: IndexPath) -> UITableViewCell? {
      availableCells.first { self.indexPath(for: $0) == indexPath }
   }
}
/**
 * UITableViewDelegate extension
 */
extension UITableViewDelegate where Self: UITableView {
   /**
    * Returns total height of all rows
    * - Important: ⚠️️ in the heightForRowAt class, don't use cellForRow, as the cell isn't made yet, probably shouldn't put cellForRow in that method anyways
    */
   var totalRowHeight: CGFloat {
      (0..<self.numberOfSections).indices.flatMap { sectionIdx in
         (0..<self.numberOfRows(inSection: sectionIdx)).indices.map { rowIdx in
            self.tableView!(self, heightForRowAt: IndexPath.init(row: rowIdx, section: sectionIdx))
         }
      }.reduce(0, +)
   }
}
#endif

/**
 * Returns totalRowHeight (height of all rows)
 * Fixme: ⚠️️ Upgrade this with NumberOfSections instead
 */
//    var totalRowHeight:CGFloat {
//        return sections.enumerated().map { arg -> [(section:Int,row:Int)] in
//            return arg.element.data.indices.map{ i in return (section:arg.offset,row:i)}
//            }.flatMap{$0}.reduce(0){
//                return $0 + self(self, heightForRowAt: .init(row: $1.row, section: $1.section))
//        }
//    }



/**
 * EXAMPLE: tableView.cells()//list of cells in a tableview
 */
//    static var cells:[UITableViewCell]{
//        var cells:[UITableViewCell] = []
//        (0..<tableView.numberOfSections).indices.forEach { sectionIndex in
//            (0..<tableView.numberOfRows(inSection: sectionIndex)).indices.forEach { rowIndex in
//                if let cell:UITableViewCell = tableView.cellForRow(at: IndexPath(row: rowIndex, section: sectionIndex)) {
//                    cells.append(cell)
//                }
//            }
//        }
//    }
