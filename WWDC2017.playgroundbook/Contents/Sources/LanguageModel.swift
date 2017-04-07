import Foundation

public class LanguageModel {
    
    public var lexicon = [String]()
    public var probabilities = [(String, Double)]()
    
    init(fileName: String) {
        let file = Bundle.main.path(forResource: fileName, ofType: "txt") ?? ""
        do {
            var corpus = try String(contentsOfFile: file)
            corpus = corpus.replacingOccurrences(of: "\n", with: " ")
            let comp = corpus.components(separatedBy: " ").map {
                $0.lowercased().trimmingCharacters(in: CharacterSet(charactersIn: " !.;:,?'\""))
            }
            self.lexicon = Array(Set(comp))
            var probs = [String: Double]()
            
            comp.forEach {
                if let prob = probs[$0] {
                    probs[$0] = prob + 1
                } else {
                    probs[$0] = 1
                }
            }
            
            probs.forEach { (k, v) in
                probs[k] = v/Double(comp.count)
                self.probabilities.append((k, v/Double(comp.count)))
            }
            
            self.probabilities.sort { $0.1 > $1.1 }
        } catch {}
    }
    
}

public class FairyTalesLanguageModel: LanguageModel {
    
    public init() {
        super.init(fileName: "fairy_tales")
    }
    
}

public class ParadiseLostLanguageModel: LanguageModel {
    
    public init() {
        super.init(fileName: "paradise_lost")
    }
    
}
