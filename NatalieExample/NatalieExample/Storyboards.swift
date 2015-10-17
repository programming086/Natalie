//
// Autogenerated by Natalie - Storyboard Generator Script.
// http://blog.krzyzanowskim.com
//

import UIKit

//MARK: - Storyboards

extension UIStoryboard {
    func instantiateViewController<T: UIViewController where T: IdentifiableProtocol>(type: T.Type) -> T? {
        let instance = type.init()
        if let identifier = instance.identifier {
            return self.instantiateViewControllerWithIdentifier(identifier) as? T
        }
        return nil
    }
}

protocol Storyboard {
    static var storyboard: UIStoryboard { get }
    static var identifier: String { get }
}

struct Storyboards {

    struct Main: Storyboard {

        static let identifier = "Main"

        static var storyboard: UIStoryboard {
            return UIStoryboard(name: self.identifier, bundle: nil)
        }

        static func instantiateInitialViewController() -> UINavigationController {
            return self.storyboard.instantiateInitialViewController() as! UINavigationController
        }

        static func instantiateViewControllerWithIdentifier(identifier: String) -> UIViewController {
            return self.storyboard.instantiateViewControllerWithIdentifier(identifier)
        }

        static func instantiateViewController<T: UIViewController where T: IdentifiableProtocol>(type: T.Type) -> T? {
            return self.storyboard.instantiateViewController(type)
        }

        static func instantiateMainViewController() -> MainViewController {
            return self.storyboard.instantiateViewControllerWithIdentifier("MainViewController") as! MainViewController
        }

        static func instantiateSecondViewController() -> ScreenTwoViewController {
            return self.storyboard.instantiateViewControllerWithIdentifier("secondViewController") as! ScreenTwoViewController
        }

        static func instantiateScreenOneViewController() -> ScreenOneViewController {
            return self.storyboard.instantiateViewControllerWithIdentifier("Screen One ViewController") as! ScreenOneViewController
        }
    }
}

//MARK: - ReusableKind
enum ReusableKind: String, CustomStringConvertible {
    case TableViewCell = "tableViewCell"
    case CollectionViewCell = "collectionViewCell"

    var description: String { return self.rawValue }
}

//MARK: - SegueKind
enum SegueKind: String, CustomStringConvertible {    
    case Relationship = "relationship" 
    case Show = "show"                 
    case Presentation = "presentation" 
    case Embed = "embed"               
    case Unwind = "unwind"             
    case Push = "push"                 
    case Modal = "modal"               
    case Popover = "popover"           
    case Replace = "replace"           
    case Custom = "custom"             

    var description: String { return self.rawValue } 
}

//MARK: - SegueProtocol
public protocol IdentifiableProtocol: Equatable {
    var identifier: String? { get }
}

public protocol SegueProtocol: IdentifiableProtocol {
}

public func ==<T: SegueProtocol, U: SegueProtocol>(lhs: T, rhs: U) -> Bool {
    return lhs.identifier == rhs.identifier
}

public func ~=<T: SegueProtocol, U: SegueProtocol>(lhs: T, rhs: U) -> Bool {
    return lhs.identifier == rhs.identifier
}

public func ==<T: SegueProtocol>(lhs: T, rhs: String) -> Bool {
    return lhs.identifier == rhs
}

public func ~=<T: SegueProtocol>(lhs: T, rhs: String) -> Bool {
    return lhs.identifier == rhs
}

public func ==<T: SegueProtocol>(lhs: String, rhs: T) -> Bool {
    return lhs == rhs.identifier
}

public func ~=<T: SegueProtocol>(lhs: String, rhs: T) -> Bool {
    return lhs == rhs.identifier
}

//MARK: - ReusableViewProtocol
public protocol ReusableViewProtocol: IdentifiableProtocol {
    var viewType: UIView.Type? { get }
}

public func ==<T: ReusableViewProtocol, U: ReusableViewProtocol>(lhs: T, rhs: U) -> Bool {
    return lhs.identifier == rhs.identifier
}

//MARK: - Protocol Implementation
extension UIStoryboardSegue: SegueProtocol {
}

extension UICollectionReusableView: ReusableViewProtocol {
    public var viewType: UIView.Type? { return self.dynamicType }
    public var identifier: String? { return self.reuseIdentifier }
}

extension UITableViewCell: ReusableViewProtocol {
    public var viewType: UIView.Type? { return self.dynamicType }
    public var identifier: String? { return self.reuseIdentifier }
}

//MARK: - UIViewController extension
extension UIViewController {
    func performSegue<T: SegueProtocol>(segue: T, sender: AnyObject?) {
        if let identifier = segue.identifier {
            performSegueWithIdentifier(identifier, sender: sender)
        }
    }

    func performSegue<T: SegueProtocol>(segue: T) {
        performSegue(segue, sender: nil)
    }
}

//MARK: - UICollectionView

extension UICollectionView {

    func dequeueReusableCell<T: ReusableViewProtocol>(reusable: T, forIndexPath: NSIndexPath!) -> UICollectionViewCell? {
        if let identifier = reusable.identifier {
            return dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: forIndexPath)
        }
        return nil
    }

    func registerReusableCell<T: ReusableViewProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            registerClass(type, forCellWithReuseIdentifier: identifier)
        }
    }

    func dequeueReusableSupplementaryViewOfKind<T: ReusableViewProtocol>(elementKind: String, withReusable reusable: T, forIndexPath: NSIndexPath!) -> UICollectionReusableView? {
        if let identifier = reusable.identifier {
            return dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: identifier, forIndexPath: forIndexPath)
        }
        return nil
    }

    func registerReusable<T: ReusableViewProtocol>(reusable: T, forSupplementaryViewOfKind elementKind: String) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            registerClass(type, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        }
    }
}
//MARK: - UITableView

extension UITableView {

    func dequeueReusableCell<T: ReusableViewProtocol>(reusable: T, forIndexPath: NSIndexPath!) -> UITableViewCell? {
        if let identifier = reusable.identifier {
            return dequeueReusableCellWithIdentifier(identifier, forIndexPath: forIndexPath)
        }
        return nil
    }

    func registerReusableCell<T: ReusableViewProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
            registerClass(type, forCellReuseIdentifier: identifier)
        }
    }

    func dequeueReusableHeaderFooter<T: ReusableViewProtocol>(reusable: T) -> UITableViewHeaderFooterView? {
        if let identifier = reusable.identifier {
            return dequeueReusableHeaderFooterViewWithIdentifier(identifier)
        }
        return nil
    }

    func registerReusableHeaderFooter<T: ReusableViewProtocol>(reusable: T) {
        if let type = reusable.viewType, identifier = reusable.identifier {
             registerClass(type, forHeaderFooterViewReuseIdentifier: identifier)
        }
    }
}


//MARK: - MainViewController
extension UIStoryboardSegue {
    func selection() -> MainViewController.Segue? {
        if let identifier = self.identifier {
            return MainViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension MainViewController: IdentifiableProtocol { 
    var identifier: String? { return "MainViewController" }
    static var identifier: String? { return "MainViewController" }
}

extension MainViewController { 

    enum Segue: String, CustomStringConvertible, SegueProtocol {
        case ScreenOneSegueButton = "Screen One Segue Button"
        case ScreenOneSegue = "ScreenOneSegue"
        case ScreenTwoSegue = "ScreenTwoSegue"
        case SceneOneGestureRecognizerSegue = "SceneOneGestureRecognizerSegue"

        var kind: SegueKind? {
            switch (self) {
            case ScreenOneSegueButton:
                return SegueKind(rawValue: "push")
            case ScreenOneSegue:
                return SegueKind(rawValue: "push")
            case ScreenTwoSegue:
                return SegueKind(rawValue: "push")
            case SceneOneGestureRecognizerSegue:
                return SegueKind(rawValue: "push")
            }
        }

        var destination: UIViewController.Type? {
            switch (self) {
            case ScreenOneSegueButton:
                return ScreenOneViewController.self
            case ScreenOneSegue:
                return ScreenOneViewController.self
            case ScreenTwoSegue:
                return ScreenTwoViewController.self
            case SceneOneGestureRecognizerSegue:
                return ScreenOneViewController.self
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}

//MARK: - ScreenTwoViewController
extension ScreenTwoViewController: IdentifiableProtocol { 
    var identifier: String? { return "secondViewController" }
    static var identifier: String? { return "secondViewController" }
}

extension ScreenTwoViewController { 

    enum Reusable: String, CustomStringConvertible, ReusableViewProtocol {
        case MyCell = "MyCell"

        var kind: ReusableKind? {
            switch (self) {
            case MyCell:
                return ReusableKind(rawValue: "tableViewCell")
            }
        }

        var viewType: UIView.Type? {
            switch (self) {
            default:
                return nil
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}


//MARK: - ScreenOneViewController
extension ScreenOneViewController: IdentifiableProtocol { 
    var identifier: String? { return "Screen One ViewController" }
    static var identifier: String? { return "Screen One ViewController" }
}

