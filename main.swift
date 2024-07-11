import Foundation

var tuple = (pullUps:15, pushUps:30, squits:20)
var tupl : (Int, String) = (1, "s")
// print(tupl)
// print(tuple)

var apple : Int? = 5
if apple == nil {
    // print("apple is nil")
} else {
    let a = apple! + 10
    // print(a) //a became integer
}

var apples : Int? = nil
if var number = apples { // <- вот это возвращает false если apples = nil (называется optional binding)
    number += 2
} else {
    // print("nil apples")
}

var age = "50"
if let intAge = Int(age) {
    // print(intAge)
} else {
    // print("age is nil")
}

//Int! - implicitly unwrapped optional

for i in 0...4 { //0..<5
    // print(i)
}

var str = ""
str += "abc"
// print(str)

// print((str as NSString).length)
// print(str.count)

if str == "a" {
    // print("equal")
} else {
    // print("not equal")
}

var array = ["a", "ab", "ba"]
var money : [Int] = Array(repeating: 1, count: 10)
for (index, value) in money.enumerated() {
    // print("\(index) element: \(value)")
}
if array.isEmpty {
    // print("empty")
} else {
    // print(array)
}

var dict : [String:String] = ["1":"car", "2":"plane"]
// print(dict)
dict["3"] = "train" // append
// dict = [:]
// print(dict.keys)
// print dictionaries
for key in dict.keys {
    // print("key = \(key), value = \(dict[key]!)")
}
for (key, value) in dict {
    // print("key = \(key), value = \(value)")
}
/*
1. создать дикшинари студентов, где ключ имяФамилия, а значение - оценка
парочке студентам повысить оценку
добавить еще студентов и их оценки
удалить пару студентов и их оценки
посчитать общий балл группы и средний балл

2. создать дикшинари месяца и дни, String: Int
вывести экран циклом тюплом
вывести экран циклом пройдя по массивам ключей

3. создать дикшинари у которой ключ это адрес ячейки на шахматной доске, а значение - bool, где черн - тру, а белая - фолс
*/
var students : [String:Int] = ["Nikolay Ratushnyak":4, "Leonid Shaikhutdinov":4, "Stepan Tleubaev":3]
students.updateValue(4, forKey: "Stepan Tleubaev")
var general = 0.0
var avrg = 0.0
for i in students.values {
    general += Double(i)
}
avrg = general / Double(students.count)
print("general \(general), average \(avrg)")

var chess : [String:Bool] = [:]
let a = "a"
if var scalar = a.unicodeScalars.first {
    var firstKey = scalar.value
    print("unicode \(firstKey)")
    for i in 0..<9 {
        for j in 1..<9 {
            var fullKey = String(UnicodeScalar(Int(firstKey) + i) ?? "-") + "\(j)"
            var fullVal = false
            if (i + j) % 2 == 0 {
                fullVal = true
            }
            chess[fullKey] = fullVal
        }
    }
    print(chess)
}

// Sets
var letters = Set<Character>()
letters.insert("a")
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// print(oddDigits.union(evenDigits).sorted())
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
// print(oddDigits.intersection(evenDigits).sorted())
// []
// print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
// [1, 9]
// print(oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted())
// [1, 2, 9]
