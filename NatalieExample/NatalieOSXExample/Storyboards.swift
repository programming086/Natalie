//
// Autogenerated by Natalie - Storyboard Generator
// by Marcin Krzyzanowski http://krzyzanowskim.com
//
import Cocoa

//MARK: - Storyboards

extension NSStoryboard {
    func instantiateViewController<T: NSWindowController>(ofType type: T.Type) -> T? where T: IdentifiableProtocol {
        let instance = type.init()
        if let identifier = instance.storyboardIdentifier {
            return self.instantiateController(withIdentifier: identifier) as? T
        }
        return nil
    }

    func instantiateViewController<T: NSViewController>(ofType type: T.Type) -> T? where T: IdentifiableProtocol {
        let instance = type.init()
        if let identifier = instance.storyboardIdentifier {
            return self.instantiateController(withIdentifier: identifier) as? T
        }
        return nil
    }

}

protocol Storyboard {
    static var storyboard: NSStoryboard { get }
    static var identifier: String { get }
}

struct Storyboards {

    struct Main: Storyboard {

        static let identifier = "Main"

        static var storyboard: NSStoryboard {
            return NSStoryboard(name: self.identifier, bundle: nil)
        }

        static func instantiateInitialController() -> NSWindowController {
            return self.storyboard.instantiateInitialController() as! NSWindowController
        }

        static func instantiateController(withIdentifier: String) -> NSWindowController {
            return self.storyboard.instantiateController(withIdentifier: identifier) as! NSWindowController
        }

        static func instantiateViewController<T: NSWindowController>(ofType type: T.Type) -> T? where T: IdentifiableProtocol {
            return self.storyboard.instantiateViewController(ofType: type)
        }

        static func instantiateController(withIdentifier: String) -> NSViewController {
            return self.storyboard.instantiateController(withIdentifier: identifier) as! NSViewController
        }

        static func instantiateViewController<T: NSViewController>(ofType type: T.Type) -> T? where T: IdentifiableProtocol {
            return self.storyboard.instantiateViewController(ofType: type)
        }
    }
}

//MARK: - ReusableKind
enum ReusableKind: String, CustomStringConvertible {
    case tableViewCell = "tableViewCell"
    case collectionViewCell = "collectionViewCell"

    var description: String { return self.rawValue }
}

//MARK: - SegueKind
enum SegueKind: String, CustomStringConvertible {    
    case relationship = "relationship" 
    case show = "show"                 
    case presentation = "presentation" 
    case embed = "embed"               
    case unwind = "unwind"             
    case push = "push"                 
    case modal = "modal"               
    case popover = "popover"           
    case replace = "replace"           
    case custom = "custom"             

    var description: String { return self.rawValue } 
}

//MARK: - IdentifiableProtocol

public protocol IdentifiableProtocol: Equatable {
    var storyboardIdentifier: String? { get }
}

//MARK: - SegueProtocol

public protocol SegueProtocol {
    var identifier: String? { get }
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
    var viewType: NSView.Type? { get }
}

public func ==<T: ReusableViewProtocol, U: ReusableViewProtocol>(lhs: T, rhs: U) -> Bool {
    return lhs.storyboardIdentifier == rhs.storyboardIdentifier
}

//MARK: - Protocol Implementation
extension NSStoryboardSegue: SegueProtocol {
}

//MARK: - NSViewController extension
extension NSViewController {
    func perform<T: SegueProtocol>(segue: T, sender: Any?) {
        if let identifier = segue.identifier {
            performSegue(withIdentifier: identifier, sender: sender)
        }
    }

    func perform<T: SegueProtocol>(segue: T) {
        perform(segue: segue, sender: nil)
    }
}

//MARK: - NSWindowController extension
extension NSWindowController {
    func perform<T: SegueProtocol>(segue: T, sender: Any?) {
        if let identifier = segue.identifier {
            performSegue(withIdentifier: identifier, sender: sender)
        }
    }

    func perform<T: SegueProtocol>(segue: T) {
        perform(segue: segue, sender: nil)
    }
}


//MARK: - MainViewController
extension NSStoryboardSegue {
    func selection() -> MainViewController.Segue? {
        if let identifier = self.identifier {
            return MainViewController.Segue(rawValue: identifier)
        }
        return nil
    }
}

extension MainViewController { 

    enum Segue: String, CustomStringConvertible, SegueProtocol {
        case screenOneSegue = "ScreenOneSegue"
        case screenTwoSegue = "ScreenTwoSegue"
        case screenOneSegueButton = "ScreenOneSegueButton"
        case sceneOneGestureRecognizerSegue = "SceneOneGestureRecognizerSegue"

        var kind: SegueKind? {
            switch (self) {
            case .screenOneSegue:
                return SegueKind(rawValue: "modal")
            case .screenTwoSegue:
                return SegueKind(rawValue: "modal")
            case .screenOneSegueButton:
                return SegueKind(rawValue: "modal")
            case .sceneOneGestureRecognizerSegue:
                return SegueKind(rawValue: "modal")
            }
        }

        var destination: AnyObject.Type? {
            switch (self) {
            case .screenOneSegue:
                return ScreenOneViewController.self
            case .screenTwoSegue:
                return ScreenTwoViewController.self
            case .screenOneSegueButton:
                return ScreenOneViewController.self
            case .sceneOneGestureRecognizerSegue:
                return ScreenOneViewController.self
            }
        }

        var identifier: String? { return self.description } 
        var description: String { return self.rawValue }
    }

}

//MARK: - ScreenOneViewController

//MARK: - ScreenTwoViewController

