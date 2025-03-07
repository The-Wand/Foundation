
## **[Declarative Programming Language](https://github.com/The-Wand/Wand)**

|wand created to support all platfroms   
Prototype implemented on Swift

### Swift Package
[📦 |Foundation](https://github.com/The-Wand/Foundation)  

### ⚙️ Usage

```swift
//Wait for a Notification
UIApplication.didBecomeActiveNotification | { (n: Notification) in

}
```

```swift
//Resize to (42, 42) aspect fill
image | .fill(to: 42|) { (out: UIImage) in

}
```

```swift
//Resize to (42, 42) aspect fit
image | .fit(to: 42|) { (out: UIImage) in

}
```

```swift
//Rescale to (42, 42)
image | .scale(to: 42|) { (scaled: UIImage) in

}
```

```swift
//Add rounded corners
image | .round(to: 42) { (scaled: UIImage) in

}
```

### 💡 Idea
  Imagine that you have the black box that can give you an ```Any``` object.   
  You don't know what's already in the box and [what happens inside.](https://wikipedia.org/wiki/Encapsulation_(computer_programming))   
      
  Ask for object that you need with |

```bash
|{ (result: Object) in
            
}
```
```bash
ingredients | { (result: Object) in
            
}
```
```bash
ingredients | .one { (t: T) in
            
} | .every { (u: U) in

} | .while { (v: V) in
  true
}
```

### 🪄 Сoncept

Wand started from the idea about receiving anything in most efficient way.   
Add one sign to anything and retreive the result 📦

You ideas, comments and contributions are welcome |

[Alex Kozin](mailto:al@el-machine.com)  
[El Machine 🤖](https://el-machine.com)
