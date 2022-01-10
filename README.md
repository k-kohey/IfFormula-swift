# IfFormula-swift

Package for getting the result of each conditional expression of an if statement.


# Usage

Pattern matching using Bool values is possible, as shown below.
If there is no else expression, it is unclear if a return value exists. Therefore, the return value will be Optional type.

```swift

import IfFormula

let result = resultIf(condition1) {
        var result: Int = ...
        // something
        return result
    }.elseIf(condition2) {
        2
    }.else {
        3
    }.end()
```

