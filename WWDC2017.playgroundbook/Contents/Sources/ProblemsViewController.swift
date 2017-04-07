import UIKit

public class ProblemsViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupTitle()
        setupText1()
        setupText2()
    }
    
    func setupTitle() {
        let label = UILabel(frame: CGRect(x: 50,
                                          y: 0,
                                          width: view.frame.width,
                                          height: 100))
        label.text = "Aphasia"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.white
        
        let subtitleView = UIView(frame: CGRect(x: 0, y: label.frame.height - 4, width: label.frame.width, height: 4))
        subtitleView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(subtitleView)
        view.addSubview(label)
    }
    
    func setupText1() {
        
        let containerView = UIView(frame: CGRect(x: 0, y: 120, width: view.frame.width, height: 220))
        
        
        let title1Label = UILabel(frame: CGRect(x: 20, y: 0, width: 120, height: 50))
        title1Label.text = "Syntax"
        title1Label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title1Label.font = UIFont.boldSystemFont(ofSize: 25)
        
        containerView.addSubview(title1Label)
        
        let mainLabel = UILabel(frame: CGRect(x: 20, y: 60, width: 120, height: 50))
        mainLabel.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        mainLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        mainLabel.layer.cornerRadius = 8
        mainLabel.layer.masksToBounds = true
        mainLabel.textAlignment = .center
        mainLabel.text = "The girl"
        mainLabel.font = UIFont.systemFont(ofSize: 25)
        
        let questionLabel1 = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let questionLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        questionLabel1.center = mainLabel.center
        questionLabel2.center = mainLabel.center
        
        questionLabel1.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        questionLabel1.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        questionLabel1.layer.cornerRadius = 20
        questionLabel1.layer.masksToBounds = true
        questionLabel1.textAlignment = .center
        questionLabel1.text = "?"
        
        questionLabel2.textColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        questionLabel2.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        questionLabel2.layer.cornerRadius = 20
        questionLabel2.layer.masksToBounds = true
        questionLabel2.textAlignment = .center
        questionLabel2.text = "?"
        
        containerView.addSubview(questionLabel1)
        containerView.addSubview(questionLabel2)
        
        containerView.addSubview(mainLabel)
        view.addSubview(containerView)
        
        let remainderLabel = UILabel(frame: CGRect(x: 20 + mainLabel.frame.width + 8, y: 60, width: containerView.frame.width - (40 + 8 + mainLabel.frame.width), height: 50))
        remainderLabel.text = "that Johnny likes"
        remainderLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        remainderLabel.font = UIFont.systemFont(ofSize: 25)
        containerView.addSubview(remainderLabel)
        
        let textLabel = UILabel(frame: CGRect(x: 20, y: 118, width: containerView.frame.width - 40, height: 50))
        textLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textLabel.text = "didn't come to school today."
        textLabel.font = UIFont.systemFont(ofSize: 25)
        containerView.addSubview(textLabel)
        
        UIView.animate(withDuration: 1, delay: 3, options: [.curveEaseInOut], animations: {
            questionLabel1.transform = questionLabel1.transform.translatedBy(x: 230, y: -50)
            questionLabel2.transform = questionLabel2.transform.translatedBy(x: 40, y: 105)
        }) { (finished) in
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse, .curveEaseInOut], animations: {
                questionLabel1.transform = questionLabel1.transform.translatedBy(x: 0, y: 10)
                questionLabel2.transform = questionLabel2.transform.translatedBy(x: 0, y: -10)
            }, completion: nil)
        }
    }
    
    func setupText2() {
        let containerView = UIView(frame: CGRect(x: 0, y: 400, width: view.frame.width, height: 220))
        
        
        let title1Label = UILabel(frame: CGRect(x: 20, y: 0, width: 120, height: 50))
        title1Label.text = "Lexicon"
        title1Label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        title1Label.font = UIFont.boldSystemFont(ofSize: 25)
        
        containerView.addSubview(title1Label)
        view.addSubview(containerView)
        
        let textLabel = UILabel(frame: CGRect(x: 20, y: 60, width: containerView.frame.width - 40, height: 50))
        textLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textLabel.text = "Johnny, did you give milk"
        textLabel.font = UIFont.systemFont(ofSize: 25)
        containerView.addSubview(textLabel)
        
        let remainingLabel = UILabel(frame: CGRect(x: 20, y: 128, width: containerView.frame.width - 40, height: 50))
        remainingLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        remainingLabel.text = "to the"
        remainingLabel.font = UIFont.systemFont(ofSize: 25)
        containerView.addSubview(remainingLabel)
        
        let mainLabel = UILabel(frame: CGRect(x: 100, y: 128, width: 90, height: 50))
        mainLabel.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        mainLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        mainLabel.layer.cornerRadius = 8
        mainLabel.layer.masksToBounds = true
        mainLabel.textAlignment = .center
        mainLabel.text = "cat?"
        mainLabel.font = UIFont.systemFont(ofSize: 25)
        
        let questionLabel1 = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let questionLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        questionLabel1.center = mainLabel.center
        questionLabel2.center = mainLabel.center
        
        questionLabel1.textAlignment = .center
        questionLabel1.text = "😺"
        
        questionLabel2.textAlignment = .center
        questionLabel2.text = "🙀"
        
        UIView.animate(withDuration: 1, delay: 3, options: [.repeat, .autoreverse, .curveEaseInOut], animations: {
            questionLabel1.transform = questionLabel1.transform.translatedBy(x: 70, y: 0)
            questionLabel2.transform = questionLabel2.transform.translatedBy(x: 0, y: 50)
        }, completion: nil)
        
        containerView.addSubview(questionLabel1)
        containerView.addSubview(questionLabel2)
        
        containerView.addSubview(mainLabel)
        
        catLabel = mainLabel
        
        
        
        animateCatLabel()
        
    }
    
    var index = 0
    var wordsPhon = ["cat", "hat?", "dog?", "sat?", "lion?",  "cap?", "owl?"]
    var catLabel: UILabel!
    var timer: Timer?
    
    func animateCatLabel() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true, block: { (timer) in
            self.catLabel.text = self.wordsPhon[self.index]
            self.index += 1
            if self.index >= 6 { self.index = 0 }
        })
        
    }
    
    
    func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [#colorLiteral(red: 0.364705890417099, green: 0.0666666701436043, blue: 0.968627452850342, alpha: 1.0), #colorLiteral(red: 0.854901969432831, green: 0.250980406999588, blue: 0.47843137383461, alpha: 1.0)].map({ $0.cgColor })
        view.layer.insertSublayer(gradient, at: 0)
    }
    
}
