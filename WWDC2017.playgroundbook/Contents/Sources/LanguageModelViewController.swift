import UIKit
import CoreMotion

public class LanguageModelViewController: UIViewController {
    
    var animator: UIDynamicAnimator?
    var animatorUp: UIDynamicAnimator?
    var gravity: UIGravityBehavior?
    var gravityUp: UIGravityBehavior?
    var collision: UICollisionBehavior?
    var collisionUp: UICollisionBehavior?
    var elasticity: UIDynamicItemBehavior?
    var elasticityUp: UIDynamicItemBehavior?
    var manager: CMMotionManager?
    
    
    public var numberOfLikelyWords = 10 {
        didSet {
            reloadData()
        }
    }
    
    public var numberOfNormalWords = 10 {
        didSet {
            reloadData()
        }
    }
    
    public var languageModel: LanguageModel? {
        didSet {
            reloadData()
        }
    }
    
    // MARK: - Life cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        configureMotions()
        configureAnimator()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [#colorLiteral(red: 0.364705890417099, green: 0.0666666701436043, blue: 0.968627452850342, alpha: 1.0), #colorLiteral(red: 0.854901969432831, green: 0.250980406999588, blue: 0.47843137383461, alpha: 1.0)].map({ $0.cgColor })
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    func removeAnimations(view: UIView) {
        gravity?.removeItem(view)
        gravityUp?.removeItem(view)
        collision?.removeItem(view)
        collisionUp?.removeItem(view)
        elasticity?.removeItem(view)
        elasticityUp?.removeItem(view)
    }
    
    func reloadData() {
        for v in view.subviews {
            if let v = v as? FloatingView {
                removeAnimations(view: v)
                v.removeFromSuperview()
                
            }
        }
        for i in 0..<numberOfNormalWords {
            let count = languageModel?.probabilities.count ?? 0
            let start = count - (Int(Double(count)/1.618))
            let text = languageModel?.probabilities[start + i].0 ?? ""
            let v = FloatingView(text: text)
            v.center = CGPoint(x: 200+5*i, y: 400 + 5*i)
            v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.6)
            v.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            view.addSubview(v)
            gravity?.addItem(v)
            collision?.addItem(v)
            elasticity?.addItem(v)
        }
        
        for i in 0..<numberOfLikelyWords {
            let text = languageModel?.probabilities[i].0 ?? ""
            let v = FloatingView(text: text)
            v.center = CGPoint(x: 300 - 10*i, y: 600 - 5*i)
            v.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.6)
            v.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            view.addSubview(v)
            gravityUp?.addItem(v)
            collisionUp?.addItem(v)
            elasticityUp?.addItem(v)
        }
    }
    
    // MARK: - Gravity
    
    func configureMotions() {
        manager = CMMotionManager()
        manager?.startDeviceMotionUpdates(to: .main, withHandler: { (data, error) in
            if let error = error {
                // ...
                print(error)
            }
            
            if let data = data {
                self.gravity?.gravityDirection.dx = CGFloat(-data.gravity.y)
                self.gravity?.gravityDirection.dy = CGFloat(-data.gravity.x)
                self.gravityUp?.gravityDirection.dx = CGFloat(-data.gravity.y)
                self.gravityUp?.gravityDirection.dy = CGFloat(data.gravity.x)
            }
            
        })
    }
    
    func configureAnimator() {
        animator = UIDynamicAnimator(referenceView: self.view)
        animatorUp = UIDynamicAnimator(referenceView: self.view)
        
        gravity = UIGravityBehavior()
        gravityUp = UIGravityBehavior()
        gravity?.gravityDirection.dy = 10.0
        gravityUp?.gravityDirection.dy = -10.0
        
        collision = UICollisionBehavior()
        collisionUp = UICollisionBehavior()
        // Force unwrap is ugly!!! 🤢 but I forgive you 😀
        animator?.addBehavior(gravity!)
        animator?.addBehavior(collision!)
        
        animatorUp?.addBehavior(gravityUp!)
        animatorUp?.addBehavior(collisionUp!)
        
        // tests
        collision?.translatesReferenceBoundsIntoBoundary = true
        collision?.collisionMode = .everything
        
        collisionUp?.translatesReferenceBoundsIntoBoundary = true
        collisionUp?.collisionMode = .everything
        //        collision?.addItem(view)
        
        //        gravity?.gravityDirection
        
        elasticity = UIDynamicItemBehavior()
        elasticity?.elasticity = 0.5
        
        elasticityUp = UIDynamicItemBehavior()
        elasticityUp?.elasticity = 0.5
        
        animator?.addBehavior(elasticity!)
        animatorUp?.addBehavior(elasticityUp!)
    }
    
    
}

class FloatingView: UIView {
    
    var size: CGFloat = 70.0
    var textColor: UIColor = UIColor.black
    
    var label: UILabel?
    
    init(text: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        let label = UILabel(frame: CGRect(x: 0,
                                          y: 0,
                                          width: size / 1.618,
                                          height: size))
        label.textAlignment = .center
        label.text = text
        label.center = center
        label.minimumScaleFactor = 0.3
        label.adjustsFontSizeToFitWidth = true
        label.textColor = textColor
        addSubview(label)
        self.label = label
        layer.cornerRadius = frame.width/2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label?.textColor = textColor
    }
    
}
