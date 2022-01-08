# IfFormula-swift

Package for getting the result of each conditional expression of an if statement.


# Usage

```swift

import IfFormula

let result = resultIf(true) {
        1
    }.elseIf(false) {
        2
    }.else {
        3
    }.end()

print(result) // 1
```
