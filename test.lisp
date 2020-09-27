;; GOC is nornorm's custom language heavily similarity lisp rules and some functions and used by own Bytecodes. That language was used purpose to try make first time game object code language.
;; GOC is middle level language
;; That was idea from Andy Gavin's Blog about Crash Bandicoot GOOL.
;; Script: test.lisp
;; Description: about that language
;; Date: 27.09.2020

;; + - * / & >> << += -= *= /= &= >>= <<= 
(+ $acc 5)
(= $mem1 $acc) ; OR
(+= $mem1 5)

;; if else == != <= >=
(if $zero $zero ==
(output "Hello, World!"))

(= $mem1 5)
(if $mem1 5 != (return)
(else (output "Ha! You've been fall for that!")))

;; while loops true only
(while $zero $zero == (output "Oh uh a loop!")) ; creates infinity loop next example

(= $mem1 10)
(while $mem1 $zero != 
(+= $mem2 2)
(-= $mem1 1))
(show-reg $mem2)

;; repeat same lua but it loops false only
(= $mem1 0x80)
(repeat-until $mem1 $zero == (-= $mem1 1))

;; expression
(expr a 0x80)
(expr b 7)
(= $mem1 0xFF)
(& $mem1 a)
(>> $acc b)
(= $mem1 $acc)

;; subroutine same like lisp it supports lambda lists
(sub woops (a b)
(+ $mem1 a)(* $acc b)
(= $mem1 $acc))

;; subroutine calls differently than lisp behaviour
(woops 2 4)

;; asm same behaviour like subroutine but its bytecodes assembly language  but it creates stack calls from JAL instruction.
(asm subroutine_instructions () "
 .instructions
 mov $acc, $zero, 5
 mul $acc, $zero, 5
 mov $mem1, $acc, 0")

(sub subroutine () (subroutine_instructions))

;; inline it wont create stacks by using JAL sub or asm blocks 
(inline sub a ()
(output 'Hoi!'))
(a)

;; it will looks like this
;; CONST 1
;; CALL 0, 1, $CONST 
;; RET

;; theres some different without inline
;; SUB_0000:
;; CONST 1
;; CALL 0, 1, $CONST
;; RET
;; JAL SUB_0000
;; RET

;; sooner ill add more about norn's language.

(return)
