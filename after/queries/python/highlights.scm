; extends

; Module docstring
(module . (expression_statement (string) @comment.docs))

; Class docstring
(class_definition
  body: (block . (expression_statement (string) @comment.docs)))

; Function/method docstring
(function_definition
  body: (block . (expression_statement (string) @comment.docs)))

; Attribute docstring
((expression_statement (assignment)) . (expression_statement (string) @comment.docs))
