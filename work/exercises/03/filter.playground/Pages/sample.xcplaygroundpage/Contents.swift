//: # 解答例
//: ## filter
//: * [演習へ](@previous)
import Foundation

let languages = ["Objective-C", "Swift", "Ruby", "Kotlin", "Smalltalk"]

let shortLanguages = languages.filter { (language) -> Bool in
    language.count <= 5
}

for language in shortLanguages {
    print(language)
}
