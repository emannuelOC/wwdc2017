/*:
 **👨🏻‍💻👩🏻‍⚕️ How technology can help**
 
 I'm a big fan of interfaces between different areas and in 
 the case of Neurological Language Problems, technology can 
 really help.
 
 The fact that nowadays we have an amazing computer in our 
 pockets, access to the internet and artificial intelligence
 creates a great oportunity for improving the diagnosis and 
 treatment for neurological diseases that affect language.
 
 Here's an example.
 
 For patients with some types of aphasia and patients with 
 dementia, a Discourse Analysis can be a helpful tool to 
 distinguish the patient condition. However transcribing,
 classifying and counting words and also calculating isn't 
 the easiest task. 
 
 With an iOS device, a patient can have a discourse sample
 collected and analysed from his own couch. 
 
 Here's a (again, very simple) example of how this could
 be done. 
 
 You can write a text in the box below describing the image. The text will
 be processed and some valueable informations will be presented.
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let vc = TreatmentViewController()


PlaygroundPage.current.liveView = vc

//#-end-hidden-code

/*#-editable-code */ var text = "<#text to be analysed#>" /*#-end-editable-code*/

//#-hidden-code
let analysis = DAAnalysis(text: text)
analysis.analyzeText(text) { (dict) in
    let n = dict["Tokens"] ?? 1.0
    var data = [(String, Double)]()
    for (k, v) in dict {
        if k != "Tokens" {
            data.append((k, v/n))
        }
    }
    vc.data = data
}
//#-end-hidden-code
