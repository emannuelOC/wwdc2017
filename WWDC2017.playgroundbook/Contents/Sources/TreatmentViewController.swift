import UIKit

public class TreatmentViewController: UIViewController {
    
    public var data = [(String, Double)]() {
        didSet {
            updateUI()
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupDiscourseAnalysis()
        setupComprehensionExercise()
        setupGradient()
    }
    
    var lineViews = [UIView]()
    var labels = [UILabel]()
    
    func updateUI() {
        for i in 0..<data.count {
            print("it did pass here")
            if i < labels.count {
                print("now setting the label")
                labels[i].text = data[i].0
                                UIView.animate(withDuration: 1, animations: {
                                    self.lineViews[i].frame = CGRect(x: self.lineViews[i].frame.origin.x,
                                                                     y: self.lineViews[i].frame.origin.y,
                                                                     width: max(10, self.lineViews[i].frame.width * CGFloat(self.data[i].1 * 50)),
                                                                     height: self.lineViews[i].frame.height)
                                })
            }
        }
    }
    
    func setupDiscourseAnalysis() {
        let containerView = UIView(frame: CGRect(x: 0, y: 380, width: view.frame.width, height: 380))
        // insert title <------
        var offset = 40
        for _ in 0..<7 {
            print("for inside setup")
            let label = UILabel(frame: CGRect(x: 20, y: offset, width: 200, height: 30))
            containerView.addSubview(label)
            labels.append(label)
            label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            let lineView = UIView(frame: CGRect(x: 228, y: offset+20, width: 10, height: 10))
            lineView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            lineView.layer.cornerRadius = 5
            containerView.addSubview(lineView)
            lineViews.append(lineView)
            offset += 40
        }
        view.addSubview(containerView)
    }
    
    func setupComprehensionExercise() {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 380))
        
        let title1Label = UILabel(frame: CGRect(x: 40, y: 50, width: 320, height: 50))
        title1Label.text = "Discourse Analysis"
        title1Label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title1Label.font = UIFont.boldSystemFont(ofSize: 25)
        
        containerView.addSubview(title1Label)
        
        let imageView = UIImageView(frame: CGRect(x: 60, y: 160, width: 400, height: 200))
        let image = UIImage(named: "image")
        imageView.image = image
        containerView.addSubview(imageView)
        view.addSubview(containerView)
    }
    
    func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [#colorLiteral(red: 0.364705890417099, green: 0.0666666701436043, blue: 0.968627452850342, alpha: 1.0), #colorLiteral(red: 0.854901969432831, green: 0.250980406999588, blue: 0.47843137383461, alpha: 1.0)].map({ $0.cgColor })
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}
