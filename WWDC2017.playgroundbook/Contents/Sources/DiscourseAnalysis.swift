import Foundation

public class DAAnalysis {
    
    public var text: String
    
    public var info = [String: Double]()
    
    public var wordsAndTags = [(String, String, NSRange)]()
    
    public init(text: String) {
        self.text = text
    }
    
    // MARK: - Analysis tools
    
    public func analyzeText(_ text: String, completion: (([String: Double]) -> Void)?) {
        if text == "" {
            completion?([:])
            return
        }
        
        let options: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
        let schemes = NSLinguisticTagger.availableTagSchemes(forLanguage: "en-us")
        let tagger = NSLinguisticTagger(tagSchemes: schemes, options: Int(options.rawValue))
        tagger.string = text
        
        var result = [(String, String)]()
        
        tagger.enumerateTags(in: NSMakeRange(0, text.characters.count),
                             scheme: NSLinguisticTagSchemeLexicalClass,
                             options: options) {
                                [weak self]
                                (tag, range, _, _) in
                                let token = NSString(string: text).substring(with: range)
                                result.append(token, tag)
                                self?.wordsAndTags.append((token,tag, range))
        }
        info = createDictionaryFromTuples(tuples: result)
        completion?(info)
    }
    
    func createDictionaryFromTuples(tuples: [(String, String)]) -> [String : Double] {
        var info = [String:Double]()
        info["Tokens"] = Double(tuples.count)
        var numberOfVerbs = 0
        var numberOfNouns = 0
        var numberOfPronouns = 0
        var functionWords = 0
        var numberOfPrepositions = 0
        var numberOfConjunctions = 0
        var numberOfDeterminers = 0
        
        for (_, tag) in tuples {
            switch tag {
            case NSLinguisticTagNoun:
                numberOfNouns += 1
            case NSLinguisticTagVerb:
                numberOfVerbs += 1
            case NSLinguisticTagPronoun:
                numberOfPronouns += 1
                functionWords += 1
            case NSLinguisticTagDeterminer:
                numberOfDeterminers += 1
                functionWords += 1
            case NSLinguisticTagPreposition:
                numberOfPrepositions += 1
                functionWords += 1
            case NSLinguisticTagConjunction:
                functionWords += 1
                numberOfConjunctions += 1
            default:
                break
            }
        }
        
        info["Verbs"] = Double(numberOfVerbs)
        info["Nouns"] = Double(numberOfNouns)
        info["Pronouns"] = Double(numberOfPronouns)
        info["Prepositions"] = Double(numberOfPrepositions)
        info["Conjunctions"] = Double(numberOfConjunctions)
        info["Determiners"] = Double(numberOfDeterminers)
        var coherenceIndex = 0.0
        if numberOfNouns != 0 && tuples.count != 0 {
            coherenceIndex = (Double(numberOfPronouns) / Double(numberOfNouns))
            coherenceIndex += Double(functionWords) / Double(numberOfVerbs + numberOfNouns)
            coherenceIndex = coherenceIndex / 2.0
        }
        info["Overt Coherence"] = coherenceIndex
        
        return info
    }
    
    subscript(index: Int) -> (String, Double) {
        get {
            if index > info.count || index < 0 {
                return ("", 0.0)
            }
            let keys = [String](info.keys)
            let key = keys[index]
            if let value = info[key] {
                return (key, value)
            }
            return ("", 0.0)
        }
    }
}
