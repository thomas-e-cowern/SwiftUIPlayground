import Foundation

// LINKED LISTS

// LIST NODE
final class LinkedListNode<Element> {
    var value: Element
    var next: LinkedListNode?
    
    init(value: Element, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
}

// LiST
final class LinkedList<Element>: ExpressibleByArrayLiteral, Sequence {
    
    var start: LinkedListNode<Element>?
    
    init(arrayLiteral elements: Element...) {
        for element in elements.reversed() {
            start = LinkedListNode(value: element, next:  start)
        }
    }
    
    init(array: [Element]) {
        for element in array.reversed() {
            start = LinkedListNode(value: element, next:  start)
        }
    }
    
    func makeIterator() -> LinkedListIterator<Element> {
        LinkedListIterator(current: start)
    }
}

struct LinkedListIterator<Element>: IteratorProtocol {
    var current: LinkedListNode<Element>?
    
    mutating func next() -> LinkedListNode<Element>? {
        defer { current = current?.next }
        return current
    }
}

//let third = LinkedListNode(value: 5)
//let second = LinkedListNode(value: 3, next: third)
//let first = LinkedListNode(value: 1, next: second)
//let list = LinkedList<Int>()

//list.start = first

//let list: LinkedList<Int> = [2, 4, 6]

let array = [12, 3, 5, 78]

let list: LinkedList<Int> = LinkedList(array: array)

//var currentNode = list.start
//
//while let node = currentNode {
//    print(node.value, terminator: " ")
//    currentNode = node.next
//}

for node in list {
    print(node.value)
}

//struct LinkedListEnum<Element> {
//    var start: LinkedListNode<Element>?
//}
//
//indirect enum LinkedListNodeEnum<Element> {
//    case node(value: Element, next: LinkedListNodeEnum<Element>?)
//}
//
//var third = LinkedListNodeEnum.node(value: 5, next: nil)
//var second = LinkedListNodeEnum.node(value: 3, next: third)
//var first = LinkedListNodeEnum.node(value: 1, next: second)
//
//let listEnum = LinkedListEnum<Int>(start: first)
//var currentNode = listEnum.start


