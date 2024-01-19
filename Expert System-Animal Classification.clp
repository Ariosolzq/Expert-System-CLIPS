;*******************************
;** 动物分类专家系统        **
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
;rule ckYMF:
;   进行程序描述，提问有毛发
;****************************

(defrule ckYMF
 (declare (salience 100))
 ?x <- (start) =>
 (printout t crlf crlf crlf
	"这个程序将帮助你一步步地进行动物的分类" crlf crlf
	"有毛发吗？" crlf
	"选择 y / n -> ")
 (retract ?x)
 (assert (YMF =(read))))

;****************************
;rule ckNCR:
;	提问能产乳
;****************************
 
(defrule ckNCR
 (declare (salience 100))
(YMF ?)
 =>
 (printout t crlf crlf
	"能产乳吗？" crlf
	"选择 y / n -> ")
 (assert (NCR =(read))))

;****************************
;rule ckCR:
;	提问吃肉
;****************************
 
(defrule ckCR
 (declare (salience 100))
(NCR ?)
 =>
 (printout t crlf crlf
	"吃肉吗？" crlf
	"选择 y / n -> ")
 (assert (CR =(read))))

;****************************
;rule ckYT:
;	提问有蹄
;****************************
 
(defrule ckYT
 (declare (salience 100))
(CR ?)
 =>
 (printout t crlf crlf
	"有蹄吗？" crlf
	"选择 y / n -> ")
 (assert (YT =(read))))

;****************************
;rule ckYSSHHS:
;	提问颜色是黄褐色
;****************************
 
(defrule ckYSSHHS
 (declare (salience 100))
(YT ?)
 =>
 (printout t crlf crlf
	"颜色是黄褐色吗？" crlf
	"选择 y / n -> ")
 (assert (YSSHHS =(read))))

;****************************
;rule ckYSSBD:
;	提问有深色斑点
;****************************
 
(defrule ckYSSBD
 (declare (salience 100))
(YSSHHS ?)
 =>
 (printout t crlf crlf
	"有深色斑点吗？" crlf
	"选择 y / n -> ")
 (assert (YSSBD =(read))))

;****************************
;rule ckYHSTW:
;	提问有黑色条纹
;****************************
 
(defrule ckYHSTW
 (declare (salience 100))
(YSSBD ?)
 =>
 (printout t crlf crlf
	"有黑色条纹吗？" crlf
	"选择 y / n -> ")
 (assert (YHSTW =(read))))

;****************************
;rule ckYSSBS:
;	提问颜色是白色
;****************************
 
(defrule ckYSSBS
 (declare (salience 100))
(YHSTW ?)
 =>
 (printout t crlf crlf
	"颜色是白色吗？" crlf
	"选择 y / n -> ")
 (assert (YSSBS =(read))))

;****************************

;****************************
;rule rule1:
;	规则1
;****************************
 
(defrule rule1a
  (declare (salience 99))
  (YMF y)
 =>
 (assert (BRDW y)))

(defrule rule1b
  (declare (salience 99))
  (YMF n)
 =>
 (assert (BRDW n)))

;****************************

;****************************
;rule rule2:
;	规则2
;****************************
 
(defrule rule2a
  (declare (salience 99))
  (NCR y)
 =>
 (assert (BRDW y)))

(defrule rule2b
  (declare (salience 99))
  (NCR n)
 =>
 (assert (BRDW n)))

;****************************

;****************************
;rule rule3:
;	规则3
;****************************
 
(defrule rule3a
  (declare (salience 99))
  (CR y)
  (BRDW y)
 =>
 (assert (SRDW y)))

(defrule rule3b
  (declare (salience 99))
  (CR n)
 =>
 (assert (SRDW n)))

(defrule rule3c
  (declare (salience 99))
  (BRDW n)
 =>
 (assert (SRDW n)))

;****************************

;****************************
;rule rule4:
;	规则4
;****************************
(defrule rule4a
  (declare (salience 99))
  (YT y)
  (BRDW y)
 =>
 (assert (YTDW y)))

(defrule rule4b
  (declare (salience 99))
  (YT n)
 =>
 (assert (YTDW n)))

(defrule rule4c
  (declare (salience 99))
  (BRDW n)
 =>
 (assert (YTDW n)))

;****************************
;rule rule5:
;	规则5
;****************************
 
(defrule rule5a
  (declare (salience 99))
  (YSSBD y)
  (YSSHHS y)
  (SRDW y)
 =>
 (assert (LB y)))

(defrule rule5b
  (declare (salience 99))
  (YSSBD n)
=>
 (assert (LB n)))

(defrule rule5c
(declare (salience 99))
  (YSSHHS n)
=>
 (assert (LB n)))

(defrule rule5d
(declare (salience 99))
  (SRDW n)
=>
 (assert (LB n)))

;****************************

;****************************
;rule rule6:
;	规则6
;****************************
 
(defrule rule6a
  (declare (salience 99))
  (YHSTW y)
  (YSSHHS y)
  (SRDW y)
 =>
 (assert (LH y)))

(defrule rule6b
  (declare (salience 99))
  (YSSHHS n)
=>
 (assert (LH n)))

(defrule rule6c
(declare (salience 99))
  (SRDW n)
=>
 (assert (LH n)))

(defrule rule6d
(declare (salience 99))
  (YHSTW n)
=>
 (assert (LH n)))

;****************************

;****************************
;rule rule7:
;	规则7
;****************************
 
(defrule rule7a
  (declare (salience 99))
  (YSSBS y)
  (YSSBS y)
  (YTDW y)
 =>
 (assert (BM y)))

(defrule rule7b
  (declare (salience 99))
  (YSSBS n)
=>
 (assert (BM n)))

(defrule rule7c
(declare (salience 99))
  (YTDW n)
=>
 (assert (BM n)))

(defrule rule7d
(declare (salience 99))
  (YSSBS n)
=>
 (assert (BM n)))

;****************************


;****************************
;rule result1:
;	结果1：猎豹
;****************************
 
(defrule result1
  (declare (salience 96))
  (LB y)
  (LH n)
  (BM n)
 =>
 (printout t crlf crlf
	"分类结果：猎豹。" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result2:
;	分类结果2：老虎
;****************************
 
(defrule result2
  (declare (salience 96))
  (LH y)
  (LB n)
  (BM n)
 =>
 (printout t crlf crlf
	"分类结果：老虎。" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result3:
;	分类结果3：斑马
;****************************
 
(defrule result3
  (declare (salience 96))
  (BM y)
  (LB n)
  (LH n)
 =>
 (printout t crlf crlf
	"分类结果：斑马。" crlf crlf)
 (assert (succeed)))

;****************************

;****************************

;****************************
;rule resultSucceed:
;	有分类结果
;****************************
 
(defrule resultSucceed
  (declare (salience 95))
  (succeed)
 =>
 (printout t crlf crlf
	"以上是分类结果，你选择：" crlf crlf
        "1)重新输入基本动物属性；"crlf
        "2)退出系统。"crlf
        "请输入数字1或2:")
 (assert (choice_a =(read))))

;****************************

;****************************
;rule fail1:
;	没有分类结果
;****************************
 
(defrule fail1
  (declare (salience 95))
  (LB n)
  (LH n)
  (BM n)
=>
 (printout t crlf crlf
	"基本动物属性输入有误，你选择：" crlf crlf
        "1)重新输入基本动物属性；"crlf
        "2)退出系统。"crlf
        "请输入数字1或2:")
 (assert (choice_b =(read))))

;****************************


;****************************
;rule fail2:
;	两种分类结果
;****************************
 
(defrule fail2
  (declare (salience 95))
  (LB y)
  (LH y)
  (BM n)
=>
 (printout t crlf crlf
	"没有相应规则，你选择：" crlf crlf
        "1)重新输入基本动物属性；"crlf
        "2)退出系统。"crlf
        "请输入数字1或2:")
 (assert (choice_b =(read))))

;****************************

;****************************
;rule fail3:
;	两种分类结果
;****************************
 
(defrule fail3
  (declare (salience 95))
  (LB y)
  (LH n)
  (BM y)
=>
 (printout t crlf crlf
	"没有相应规则，你选择：" crlf crlf
        "1)重新输入基本动物属性；"crlf
        "2)退出系统。"crlf
        "请输入数字1或2:")
 (assert (choice_b =(read))))

;****************************

;****************************
;rule fail4:
;	两种分类结果
;****************************
 
(defrule fail4
  (declare (salience 95))
  (LB n)
  (LH y)
  (BM y)
=>
 (printout t crlf crlf
	"没有相应规则，你选择：" crlf crlf
        "1)重新输入基本动物属性；"crlf
        "2)退出系统。"crlf
        "请输入数字1或2:")
 (assert (choice_b =(read))))

;****************************

;****************************
;rule fail5:
;	三种分类结果
;****************************
 
(defrule fail5
  (declare (salience 95))
  (LB y)
  (LH y)
  (BM y)
=>
 (printout t crlf crlf
	"没有相应规则，你选择：" crlf crlf
        "1)重新输入基本动物属性；"crlf
        "2)退出系统。"crlf
        "请输入数字1或2:")
 (assert (choice_b =(read))))

;****************************

;****************************
;rule choice1a:
;	选择1：有分类结果，重新分类
;****************************
 
(defrule choice1a
  (choice_a 1)
 =>
 (printout t crlf crlf crlf crlf
	"重新输入基本动物属性；" crlf crlf)
 (reset))

;****************************

;****************************
;rule choice2a:
;	选择2：有分类结果，退出系统
;****************************

(defrule choice2a
(choice_a 2)
 =>
 (printout t crlf crlf crlf crlf
	"退出系统。" crlf crlf)
 (assert (stop)))

;****************************

;****************************
;rule choice1b:
;	选择1：没有分类结果，重新分类
;****************************
 
(defrule choice1b
  (choice_b 1)
 =>
 (printout t crlf crlf crlf crlf
	"重新分类：" crlf crlf)
 (reset))

;****************************

;****************************
;rule choice2b:
;	选择2：没有分类结果，退出系统
;****************************

(defrule choice2b
(choice_b 2)
 =>
 (printout t crlf crlf crlf crlf
	"退出系统。" crlf crlf)
 (assert (stop)))

;****************************






有毛发 y
能产乳 n
吃肉 y
有蹄 n
黄褐色 y
深色斑点 n
黑色条纹 y
颜色白色 n
