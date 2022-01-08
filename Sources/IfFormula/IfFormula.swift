import Foundation

protocol ConditionBranchFinalizable {
    associatedtype T
    func end() -> T?
}

protocol ConditionBranchable: ConditionBranchFinalizable {
    associatedtype T
    associatedtype Next: ConditionBranchable
    func elseIf(_ condition: Bool, _ execute: @escaping () -> T) -> Next
    func `else`(_ execute: @escaping () -> T) -> ConditionEvaluator<T>
}

struct ConditionBranchGroup<T> {
    let branchs: [ConditionBranch<T>]
}

extension ConditionBranchGroup: ConditionBranchable {
    func elseIf(_ condition: Bool, _ execute: @escaping () -> T) -> ConditionBranchGroup<T> {
        let branch = ConditionBranch(condition, execute)
        return ConditionBranchGroup(branchs: branchs + [branch])
    }
    
    func `else`(_ execute: @escaping () -> T) -> ConditionEvaluator<T> {
        .init(branchs: branchs, fallback: execute)
    }
}

extension ConditionBranchGroup: ConditionBranchFinalizable {
    func end() -> T? {
        for branch in branchs where branch.condition {
            return branch.execute()
        }
        return nil
    }
}


public struct ConditionBranch<T> {
    fileprivate let condition: Bool
    fileprivate let execute: () -> T
    
    init(_ condition: Bool, _ execute: @escaping () -> T) {
        self.condition = condition
        self.execute = execute
    }
}

extension ConditionBranch: ConditionBranchable {
    func elseIf(_ condition: Bool, _ execute: @escaping () -> T) -> ConditionBranchGroup<T> {
        let elseIfBranch = ConditionBranch(condition, execute)
        return ConditionBranchGroup(branchs: [self, elseIfBranch])
    }
    
    func `else`(_ execute: @escaping () -> T) -> ConditionEvaluator<T> {
        .init(branchs: [self], fallback: execute)
    }
}

extension ConditionBranch: ConditionBranchFinalizable {
    func end() -> T? {
        condition ? execute() : nil
    }
}

struct ConditionEvaluator<T> {
    private let branchs: [ConditionBranch<T>]
    private let fallback: () -> T
    
    init(branchs: [ConditionBranch<T>], fallback: @escaping () -> T) {
        self.branchs = branchs
        self.fallback = fallback
    }

    func end() -> T {
        for branch in branchs where branch.condition {
            return branch.execute()
        }
        return fallback()
    }
}

public func resultIf<T>(
    _ condition: Bool, _ execute: @escaping () -> T
) -> ConditionBranch<T> {
    ConditionBranch(condition, execute)
}
