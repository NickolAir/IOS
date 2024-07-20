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
//print("general \(general), average \(avrg)")

var chess : [String:Bool] = [:]
let a = "a"
if var scalar = a.unicodeScalars.first {
    var firstKey = scalar.value
    //print("unicode \(firstKey)")
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
    //print(chess)
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


var Age = 21
switch Age {
case 0...21:
    print("teenager")
    fallthrough
case 60...100:
    print("senior")
default:
    print("default")
}

var name = "Nikolay"
switch (name, Age) {
case ("Nikolay", 21):
    print("Hi Nikolay")
case (_, let num) where num > 10:
    print("Hello!")
default:
    print("Hi")
}

mainLoop : for _ in 1...100 {
    for i in 1...10 {
        //print(i)
        if i == 1 {
            break mainLoop
        }
    }
}

func summArray (array : [Int]) -> Int {
    var sum = 0
    for i in array {
        sum += i
    }
    return sum
}
var arr = [1, 2, 3, 4, 5, 6]
print(summArray(array: arr))

func calculate(array : [Int], type : Int? = nil) -> (sum : Int, count : Int) {
    var sum = 0
    var count = 0
    for i in array {
        if i == type {
            sum += i
            count += 1
        }
    }
    return (sum, count)
}

func calculateSequence (Sequence seq : Int...) -> Int { // где ... несколько аргументов
    var sum = 0
    for value in seq {
        sum += value
    }
    return sum
}
print(calculateSequence(Sequence: 1, 2, 3)) // <- аналог array
// возвращать из функции можно optional

func sayHi () {
    print("Hi")
}
let h = sayHi //константа может быть функцией
h() //h теперь функция которая ничего не принимает и ничего не возвращает

func doSomething (whatToDo:()->()) { //функция может принимать функцию
    whatToDo()
}
doSomething(whatToDo: sayHi)

func returnFunc() -> ()->() { // функция может возвращать функцию
    return sayHi
}

//CLOSURES
func filterArray(array : [Int], f: (Int) -> Bool) -> [Int] {
    var filtered = [Int]()
    for i in array {
        if f(i) {
            filtered.append(i)
        }
    }
    return filtered
}

var numbers = [1, 2, 3, 4, 5, 0]
filterArray(array : numbers, f : {(i : Int) -> Bool in
    return i % 2 == 0
})

filterArray(array : numbers, f: {i in
    return i % 2 == 0
})

let sample = [1, 2]
filterArray(array: numbers) {value in
    for include in sample {
        if include == value {
            return true
        }
    }
    return false
}

//ENUM
enum Direction : String {
    case left = "Left!"
    case right = "Right"
}
enum Action {
    case Run(meters : Int, speed : Int)
    case Walk(meters : Int)
    case Stop
    case Turn(direction : Direction)
}
var action = Action.Walk(meters: 10)
action = .Run(meters: 10, speed: 5)

switch action {
case .Stop: print("stop")
case .Walk(let meters) where meters > 100: print("meters \(meters)")
    default: break
}

print(Direction.left.rawValue)

//CLASSES AND STRUCTS
class Student {
    //properties
    var name : String
    var age : Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let stud = Student(name: "Kolya", age: 21)

struct StudentStruct {
    //properties
    var name : String
    var age : Int
}
//у структуры по умолчанию есть коструктор
var studStruct = StudentStruct(name: "Ivan", age: 19)

//при работе со структурами происходит копирование, а при работе с классами используются указатели

func addOneYear(student: Student) {
    stud.age += 1
}
addOneYear(student: stud)
func addOneYear(student: inout StudentStruct) {
    stud.age += 1
}
addOneYear(student: &studStruct) //передача по указателю

//PROPERTIES
struct car {
    var model : String {
        willSet(newModel) {
            print("will set " + newModel + "intead of model")
        }
        didSet(oldModel) {
            print("did set " + model + "intead of oldModel ")
        }
    }
}

struct worker {
    var name : String
    var surname : String
    var fullName : String {
        get {
            return name + " " + surname
        }
        set {
            print("new full name is " + newValue)
            let words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                name = words[0]
            }
            if words.count > 1 {
                surname = words[1]
            }
        }
    }
    static var workerCount = 0 //это store property который принадлежит к самому классу(типу), а не к экземплярам
}
var work = worker(name: "Nick", surname: "Rt")
work.fullName

class vehicle {
    var model : String
    // пример computer property
    class var maxSpeed : Int {
        return 250 // getter
    }
    
    init(model: String) {
        self.model = model
    }
}
