import UIKit


class Node<T> {
    var value: T
    var left: Node<T>? = nil
    var right: Node<T>? = nil
    
    init(value: T) {
        self.value = value
    }
}

struct BinarySearchTree<T: Comparable> {
    var root: Node<T>? = nil
    
    
    func dfsPreOrder() -> [Node<T>?] {
        var data = [Node<T>?]()
        let rootVal = self.root // 10
        func traverse(node: Node<T>?) {
            data.append(node) // [10]
            if let leftNode = node?.left {
                traverse(node: leftNode) // [10,6,3]
            }
            if let rightNode = node?.right {
                traverse(node: rightNode) 
            }
        }
        traverse(node: rootVal)
        let nodeValues = data.compactMap { $0?.value }
        print(nodeValues)
        return data
    }
    
    func bfs() -> [Node<T>?] {
        var node = self.root // 10
        var data = [Node<T>?]()
        var queue = [Node<T>?]()
        queue.append(node) // [10]
        
        while !queue.isEmpty {
            // FIFO Approach; The first element in the array is removed
            node = queue.removeFirst() // 10, 6, 15, 3, 8
            data.append(node) // [10], [10,6], [10,6,15], [10,6,15,3] ,[10,6,15,3,8], [10,6,15,3,8,20]
            if let leftNode = node?.left {
                queue.append(leftNode) // [6], [15,3]
            }
            if let rightNode = node?.right {
                queue.append(rightNode) // [6,15], [15,3,8], [3,8,20]
            }
        }
        // check whether the sequence of the array is correct
        let nodeValues = data.compactMap { $0?.value }
        print(nodeValues)
        return data
    }
    
    mutating func insert(value: T) {
        
        var currentNode = root
        let newNode = Node(value: value)
        
        if currentNode == nil {
            root = newNode
            return
        } else {
            while true {
                guard value != currentNode!.value else { break }
                if value < currentNode!.value {
                    if currentNode?.left == nil {
                        currentNode?.left = newNode
                        break
                    } else {
                        currentNode = currentNode?.left
                    }
                } else if value > currentNode!.value {
                    if currentNode?.right == nil {
                        currentNode?.right = newNode
                        break
                    } else {
                        currentNode = currentNode?.right
                    }
                }
            }
        }
    }
}

var bst = BinarySearchTree<Int>()
bst.insert(value: 10)
bst.insert(value: 6)
bst.insert(value: 8)
bst.insert(value: 3)
bst.insert(value: 15)
bst.insert(value: 20)
bst.bfs()
bst.dfsPreOrder()
