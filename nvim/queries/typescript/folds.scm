(class_declaration) @fold

(enum_declaration) @fold

(interface_declaration) @fold

(type_alias_declaration) @fold

(method_definition) @fold

(variable_declarator
  value: (arrow_function)
) @fold

(decorator) @fold

; test cases
(call_expression
  function: (identifier) @the-function-name
  (arguments (arrow_function))
  (#match? @the-function-name "^it")
) @fold
