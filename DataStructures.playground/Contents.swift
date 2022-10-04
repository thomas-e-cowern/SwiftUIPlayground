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
final class LinkedList<Element>: ExpressibleByArrayLiteral {
    
    var start: LinkedListNode<Element>?
    
    init(arrayLiteral elements: Element...) {
        for element in elements.reversed() {
            start = LinkedListNode(value: element, next:  start)
        }
    }
}

//let third = LinkedListNode(value: 5)
//let second = LinkedListNode(value: 3, next: third)
//let first = LinkedListNode(value: 1, next: second)
//let list = LinkedList<Int>()

//list.start = first

let list: LinkedList<Int> = [2, 4, 6]

var currentNode = list.start

while let node = currentNode {
    print(node.value, terminator: " ")
    currentNode = node.next
}

