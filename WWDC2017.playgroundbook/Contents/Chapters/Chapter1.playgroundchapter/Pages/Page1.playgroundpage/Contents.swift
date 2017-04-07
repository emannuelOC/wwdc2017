/*:
 **✨ A Super Power**
 
 We tend to undervalue things that we are very familiar with.
 Language is a good example. We can't seem to notice how magical
 it is to be able to comunicate feelings, emotions and very complex
 concepts by using an extremely simple, unidimensional channel of
 phonemes or letters.
 
 I've always thought of human language as something magical and I 
 would like to share some ideas about it. 
 
 Do you have _three minutes_? 😊
 
 **👨🏻‍🔬 A (very) simple simulation**
 
 Let's make a good use of Swift Playgrounds to perform a very simple
 experiment. We will simulate what it would be like if we could control
 every linguistic data a child would be exposed when learning his own 
 language. 
 
 That can give us an idea of how much the words and phrases we hear
 from parents and everybody around us will affect how our brain will
 store and use our language.
 
 In our simulation, we will use either _a collection of fairy tales_ or
 _John Milton's Paradise Lost_.
 
 In order to simulate our experiment, you can choose between 
 `learnFromFairyTales()` or `learnFromParadiseLost()` and then we will
 be able to see how that choice will affect the language representation.
 */
//#-hidden-code
import UIKit
import PlaygroundSupport

let vc = LanguageModelViewController()
vc.languageModel = FairyTalesLanguageModel()

func learnFromFairyTales() {
    vc.languageModel = FairyTalesLanguageModel()
}

func learnFromParadiseLost() {
    vc.languageModel = ParadiseLostLanguageModel()
}

//#-end-hidden-code

/*#-editable-code */ learnFromFairyTales() /*#-end-editable-code*/

/*:
 
 The words that are most frequently present in the data are the ones going up. 
 
 If you pay attention, you'll notice they're
 pretty much the same in both cases: "the", "and", "he", "you", etc. 
 
 Those words are called
 _function words_. They have a structural importance rather than a
 rich concept behind them.
 
 However, the words in the bottom - the ones with normal frequency - can show
 the difference between growing up listening to fairy tales and growing up 
 listening to John Milton's classic. Those words are richer conceptually.
 
 You can change the number of words that should appear by editting the code below:
 */

let numberOfLikelyWords = /*#-editable-code */ 12 /*#-end-editable-code*/
let numberOfNormalWords = /*#-editable-code */ 12 /*#-end-editable-code*/

//#-hidden-code
vc.numberOfLikelyWords = numberOfLikelyWords
vc.numberOfNormalWords = numberOfNormalWords
PlaygroundPage.current.liveView = vc
//#-end-hidden-code

