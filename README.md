# Capybara
Course activities tracker app built for college students (macOS)

## Contributing
1. Install XCode
2. Clone repo
3. **Branch** off master, do not push directly to it
4. Create a PR and wait for review
5. Success

## Style
*Some borrowed from https://github.com/raywenderlich/swift-style-guide#type-inference.*

### Naming
- Clear, succinct funcs > brief or ambigious funcs
- Funcs: `camelCase`
- Types and Protocols (structs, classes): `UpperCamel`
- Constants: `camelCase` (bad: `UPPER_SNAKE`)

#### Other Naming
- Funcs that ``-> Bool`` should be named like ``isFavorited``
- Funcs that stringify should be named like ``termToString``
- Funcs that create mock views should be prefaced with ``mock``
- Funcs that create views should have simple names like ``header``

### Formatting
- This is what I like:
```
if (value) {
    ...
}
```
- This is okay too, I guess:
```
if (value)
{
    ...
}
```
- Sidenote: some people don't like wrapping conditions in `()`; that's fine
- Funcs with long signatures should have its parameters on separate lines
- Use closures if it is the last argument
- Avoid strong typing, except if needed and for arrays/dicts

### Struct, Classes
- `struct` (and `enum`) is value type, but `class` is reference type
- `self` keyword is generally unnecessary, unless required by compiler

### Comments
- Document ``///`` or mark ``// MARK:`` all funcs
- Todos ``// TODO:`` or fixmes ``// FIXME:``
- Add comments if you think your implementation won't be understood, but that probably means your implementation is not good

### Editor
- Max lines width: 100
- Indents: spaces, 4
- If over 100, new line

## Swift quirks from other C-based languages for contributors
- `nil`, not `null`
- Nullable (nilable, I guess) vars must be declared as such with an optional (``?``) like ``String?``
- `let` is immutable, `var` is mutable
- Swift `if let apple...` == Other `if (apple != nil) { ... }`
- Swift `value += 1` == Other `value++`
