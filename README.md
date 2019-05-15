# Weathery example

Purpose: REST call with swift
Ref: https://www.youtube.com/watch?v=LEFsK9mUwAE

## NOTE

- https://stackoverflow.com/questions/49610727/unable-to-bridge-nsnumber-to-float-in-json-parsing
  - JSONSerialization documentation says:
    - A Foundation object that may be converted to JSON must have the following properties:
    - The top level object is an `NSArray` or `NSDictionary`.
    - All objects are instances of `NSString`, `NSNumber`, `NSArray`, `NSDictionary`, or `NSNull`.
    - All dictionary keys are instances of `NSString`.
    - Numbers are not `NaN` or infinity.
