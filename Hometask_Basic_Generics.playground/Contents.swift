import UIKit

// =================================
// MARK: - Hometask
// =================================

/*
 Для решения данных задач используйте Generics и Closures */

/*
 1. Реализуйте универсальную функцию для выполнения простых математических операций
 2. Реализуйте универсальную функцию, которая отсортирует массив по возрастанию или убыванию
 3. Реализуйте универсальную функцию, которая отсортированный массив из задачи 2 запакует в словарь,
    где порядковый номер элемента - это ключ, а значение массива перенесите в значение словаря. */


// =================================
// MARK: - Task 1
// =================================

enum Operation {
    case subtraction
    case addition
    //case division
    case multiplication
}

func myMath<T: Numeric> (_ item1: T, _ item2: T, with operation: Operation) -> T {
    switch operation {
    case .subtraction:
        return item1 - item2
    case .addition:
        return item1 + item2
   // case .division:
   //     return item1 / item2   //Не получилось заставить работать с делением
    case .multiplication:
        return item1 * item2
    }
}

myMath(2, 3.5, with: .addition)




// =================================
// MARK: - Task 2
// =================================

enum SortCase {
    case less
    case more
}

func mySort<T: Comparable> (_ array: [T], _ operation: SortCase) -> [T]{
    switch operation {
    case .less:
        return array.sorted(by: <)
    default:
        return array.sorted(by: >)
    }
}

var tempArray = [1, 4, 2, 7, 5]

mySort(tempArray, .less)
mySort(tempArray, .more)

// =================================
// MARK: - Task 3
// =================================

func packInDict<T: Hashable> (_ array: [T]) -> [Int: T] {
    var tempDict: [Int: T] = [:]
    
    for (key, value) in array.enumerated() {
        tempDict[key] = value
    }
    
    return tempDict
}

print(packInDict(mySort(tempArray, .more)))


