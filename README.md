# Dart `rethrow` Bug

This repository demonstrates a subtle bug in Dart's exception handling related to the `rethrow` keyword. When `rethrow` is used within a `catch` block, the original exception type information is lost, making it challenging to perform specific error handling in higher-level `catch` blocks. 

The `bug.dart` file showcases the issue, while `bugSolution.dart` offers a better approach.

## How to reproduce the bug

1. Clone the repository.
2. Run `bug.dart`.
3. Observe that the caught error in `main` doesn't preserve the original exception type from the network request.