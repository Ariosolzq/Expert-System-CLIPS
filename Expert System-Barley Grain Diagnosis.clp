;*******************************
;** 麦粒肿诊断专家系统        **
;*******************************

;********************************
;rule init:
;	初始化程序
;********************************
 
(defrule init
 (declare (salience 9980))
 ?x <- (initial-fact) 
=>
 (retract ?x)
 (assert (start)))

;****************************
; rule end:
;	结束程序，退出CLIPS
;****************************

(defrule end
 (declare (salience 9200))
 ?w <- (stop)
 =>
(exit))

;****************************
;rule ckMNPGWHZ:
;   进行程序描述，提问毛囊皮根微红肿
;****************************

(defrule ckMNPGWHZ
 (declare (salience 100))
 ?x <- (start) =>
 (printout t crlf crlf crlf
	"这个程序将帮助你一步步地进行麦粒肿的诊断" crlf crlf
	"毛囊皮根微红肿吗？" crlf
	"选择 y / n -> ")
 (retract ?x)
 (assert (MNPGWHZ =(read))))

;****************************
;rule ckBSLT:
;	提问鼻塞流涕
;****************************
 
(defrule ckBSLT
 (declare (salience 100))
(MNPGWHZ ?)
 =>
 (printout t crlf crlf
	"鼻塞流涕吗？" crlf
	"选择 y / n -> ")
 (assert (BSLT =(read))))

;****************************
;rule ckYJJBMXHZ:
;	提问眼睑局部明显红肿
;****************************
 
(defrule ckYJJBMXHZ
 (declare (salience 100))
(BSLT ?)
 =>
 (printout t crlf crlf
	"眼睑局部明显红肿吗？" crlf
	"选择 y / n -> ")
 (assert (YJJBMXHZ =(read))))

;****************************
;rule ckYJJBHZ:
;	提问眼睑局部红肿
;****************************
 
(defrule ckYJJBHZ
 (declare (salience 100))
(YJJBMXHZ ?)
 =>
 (printout t crlf crlf
	"眼睑局部红肿吗？" crlf
	"选择 y / n -> ")
 (assert (YJJBHZ =(read))))

;****************************
;rule ckDJYND:
;	提问顶尖有脓点
;****************************
 
(defrule ckDJYND
 (declare (salience 100))
(YJJBHZ ?)
 =>
 (printout t crlf crlf
	"顶尖有脓点吗？" crlf
	"选择 y / n -> ")
 (assert (DJYND =(read))))

;****************************
;rule ckSTBH:
;	提问舌苔薄黄
;****************************
 
(defrule ckSTBH
 (declare (salience 100))
(DJYND ?)
 =>
 (printout t crlf crlf
	"舌苔薄黄吗？" crlf
	"选择 y / n -> ")
 (assert (STBH =(read))))

;****************************
;rule ckWNC:
;	提问胃纳差
;****************************
 
(defrule ckWNC
 (declare (salience 100))
(STBH ?)
 =>
 (printout t crlf crlf
	"胃纳差吗？" crlf
	"选择 y / n -> ")
 (assert (WNC =(read))))

;****************************
;rule ckNDPK:
;	提问脓点破溃
;****************************
 
(defrule ckNDPK
 (declare (salience 100))
(WNC ?)
 =>
 (printout t crlf crlf
	"脓点破溃吗？" crlf
	"选择 y / n -> ")
 (assert (NDPK =(read))))

;****************************

;****************************
;rule rule1:
;	规则1
;****************************
 
(defrule rule1a
  (declare (salience 99))
  (MNPGWHZ y)
 =>
 (assert (QX y)))

(defrule rule1b
  (declare (salience 99))
  (MNPGWHZ n)
 =>
 (assert (QX n)))

;****************************

;****************************
;rule rule2:
;	规则2
;****************************
 
(defrule rule2a
  (declare (salience 99))
  (BSLT y)
 =>
 (assert (WGFR y)))

(defrule rule2b
  (declare (salience 99))
  (BSLT n)
 =>
 (assert (WGFR n)))

;****************************

;****************************
;rule rule3:
;	规则3
;****************************
 
(defrule rule3a
  (declare (salience 99))
  (STBH y)
  (WNC y)
 =>
 (assert (WCJR y)))

(defrule rule3b
  (declare (salience 99))
  (STBH n)
 =>
 (assert (WCJR n)))

(defrule rule3c
  (declare (salience 99))
  (WNC n)
 =>
 (assert (WCJR n)))

;****************************

;****************************
;rule rule4:
;	规则4
;****************************
(defrule rule4a
  (declare(salience 99))
    (YJJBMXHZ y)
 =>
   (assert (ZX y)))

;****************************
;rule rule5:
;	规则5
;****************************
 
(defrule rule5a
  (declare (salience 99))
  (YJJBHZ y)
  (DJYND y)
 =>
 (assert (ZX y)))

(defrule rule5b
  (declare (salience 99))
  (YJJBMXHZ n)
  (YJJBHZ y)
  (DJYND n)
 =>
 (assert (ZX n)))

(defrule rule5c
    (declare (salience 99))
  (YJJBMXHZ n)
  (YJJBHZ n)
  (DJYND y)
 =>
 (assert (ZX n)))

;****************************

;****************************
;rule rule6:
;	规则6
;****************************
 
(defrule rule6a
  (declare (salience 99))
  (NDPK y)
 =>
 (assert (WQ y)))

(defrule rule6b
  (declare (salience 99))
  (NDPK n)
 =>
 (assert (WQ n)))

;****************************

;****************************
;rule rule7:
;	规则7
;****************************
 
(defrule rule7a
  (declare (salience 98))
  (QX y)
  (WGFR y)
 =>
 (assert (QFRX y)))

(defrule rule7b
  (declare (salience 98))
  (QX n)
 =>
 (assert (QFRX n)))

(defrule rule7c
  (declare (salience 98))
  (WGFR n)
 =>
 (assert (QFRX n)))

;****************************

;****************************
;rule rule8:
;	规则8
;****************************
 
(defrule rule8a
  (declare (salience 98))
  (WGFR y)
  (ZX y)
 =>
 (assert (ZFRX y)))

(defrule rule8b
  (declare (salience 98))
  (WGFR n)
 =>
 (assert (ZFRX n)))

(defrule rule8c
  (declare (salience 98))
  (ZX n)
 =>
 (assert (ZFRX n)))

;****************************

;****************************
;rule rule9:
;	规则9
;****************************
 
(defrule rule9a
  (declare (salience 98))
  (ZX y)
  (WCJR y)
 =>
 (assert (ZJRX y)))

(defrule rule9b
  (declare (salience 98))
  (ZX n)
 =>
 (assert (ZJRX n)))

(defrule rule9c
  (declare (salience 98))
  (WCJR n)
 =>
 (assert (ZJRX n)))

;****************************

;****************************
;rule rule10:
;	规则10
;****************************
 
(defrule rule10a
  (declare (salience 98))
  (QX y)
 =>
 (assert (SLF y)))

(defrule rule10b
  (declare (salience 98))
  (QX n)
 =>
 (assert (SLF n)))

;****************************

;****************************
;rule rule11:
;	规则11
;****************************
 
(defrule rule11a
  (declare (salience 98))
  (WQ y)
 =>
 (assert (WFYW y)))

(defrule rule11b
  (declare (salience 98))
  (WQ n)
 =>
 (assert (WFYW n)))

;****************************

;****************************
;rule rule12:
;	规则12
;****************************
 
(defrule rule12a
  (declare (salience 97))
  (QFRX y)
 =>
 (assert (SLJG y)))

(defrule rule12b
  (declare (salience 97))
  (QFRX n)
 =>
 (assert (SLJG n)))

;****************************

;****************************
;rule rule13:
;	规则13
;****************************
 
(defrule rule13a
  (declare (salience 97))
  (ZFRX y)
 =>
 (assert (TLJG y)))

(defrule rule13b
  (declare (salience 97))
  (ZFRX n)
 =>
 (assert (TLJG n)))

;****************************

;****************************
;rule rule14:
;	规则14
;****************************
 
(defrule rule14a
  (declare (salience 97))
  (ZJRX y)
 =>
 (assert (FXF y)))

(defrule rule14b
  (declare (salience 97))
  (ZJRX n)
 =>
 (assert (FXF n)))

;****************************

;****************************
;rule result1:
;	诊断结果1：采用散癞法
;****************************
 
(defrule result1
  (declare (salience 96))
  (SLF y)
 =>
 (printout t crlf crlf
	"诊断结果：可以采用散瘌法。" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result2:
;	诊断结果2：采用外敷药物
;****************************
 
(defrule result2
  (declare (salience 96))
  (WFYW y)
 =>
 (printout t crlf crlf
	"诊断结果：可以采用外敷药物。" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result3:
;	诊断结果3：采用散瘌加罐
;****************************
 
(defrule result3
  (declare (salience 96))
  (SLJG y)
 =>
 (printout t crlf crlf
	"诊断结果：可以采用散瘌加罐。" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result4:
;	诊断结果4：采用挑瘌加罐
;****************************
 
(defrule result4
  (declare (salience 96))
  (TLJG y)
 =>
 (printout t crlf crlf
	"诊断结果：可以采用挑瘌加罐。" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result5:
;	诊断结果5：采用放血法
;****************************
 
(defrule result5
  (declare (salience 96))
  (FXF y)
 =>
 (printout t crlf crlf
	"诊断结果：可以采用放血法。" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule resultSucceed:
;	有诊断结果
;****************************
 
(defrule resultSucceed
  (declare (salience 95))
  (succeed)
 =>
 (printout t crlf crlf
	"以上是诊断结果，你可以选择：" crlf crlf
        "1)继续诊断；"crlf
        "2)退出程序。"crlf
        "请输入数字1或2:")
 (assert (choice_a =(read))))

;****************************

;****************************
;rule fail:
;	没有诊断结果
;****************************
 
(defrule fail
  (declare (salience 95))
  (SLF n)
  (WFYW n)
  (SLJG n)
  (TLJG n)
  (FXF n)
 =>
 (printout t crlf crlf
	"没有诊断结果，你可以选择：" crlf crlf
        "1)重新诊断；"crlf
        "2)退出程序。"crlf
        "请输入数字1或2:")
 (assert (choice_b =(read))))

;****************************

;****************************
;rule choice1a:
;	选择1：有诊断结果，重新诊断
;****************************
 
(defrule choice1a
  (choice_a 1)
 =>
 (printout t crlf crlf crlf crlf
	"重新诊断；" crlf crlf)
 (reset))

;****************************

;****************************
;rule choice2a:
;	选择2：有诊断结果，退出程序
;****************************

(defrule choice2a
(choice_a 2)
 =>
 (printout t crlf crlf crlf crlf
	"退出程序。" crlf crlf)
 (assert (stop)))

;****************************

;****************************
;rule choice1b:
;	选择1：没有诊断结果，重新诊断
;****************************
 
(defrule choice1b
  (choice_b 1)
 =>
 (printout t crlf crlf crlf crlf
	"重新诊断：" crlf crlf)
 (reset))

;****************************

;****************************
;rule choice2b:
;	选择2：没有诊断结果，退出程序
;****************************

(defrule choice2b
(choice_b 2)
 =>
 (printout t crlf crlf crlf crlf
	"退出程序。" crlf crlf)
 (assert (stop)))

;****************************