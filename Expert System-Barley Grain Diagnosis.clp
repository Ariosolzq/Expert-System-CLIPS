;*******************************
;** ���������ר��ϵͳ        **
;*******************************

;********************************
;rule init:
;	��ʼ������
;********************************
 
(defrule init
 (declare (salience 9980))
 ?x <- (initial-fact) 
=>
 (retract ?x)
 (assert (start)))

;****************************
; rule end:
;	���������˳�CLIPS
;****************************

(defrule end
 (declare (salience 9200))
 ?w <- (stop)
 =>
(exit))

;****************************
;rule ckMNPGWHZ:
;   ���г�������������ë��Ƥ��΢����
;****************************

(defrule ckMNPGWHZ
 (declare (salience 100))
 ?x <- (start) =>
 (printout t crlf crlf crlf
	"������򽫰�����һ�����ؽ��������׵����" crlf crlf
	"ë��Ƥ��΢������" crlf
	"ѡ�� y / n -> ")
 (retract ?x)
 (assert (MNPGWHZ =(read))))

;****************************
;rule ckBSLT:
;	���ʱ�������
;****************************
 
(defrule ckBSLT
 (declare (salience 100))
(MNPGWHZ ?)
 =>
 (printout t crlf crlf
	"����������" crlf
	"ѡ�� y / n -> ")
 (assert (BSLT =(read))))

;****************************
;rule ckYJJBMXHZ:
;	���������ֲ����Ժ���
;****************************
 
(defrule ckYJJBMXHZ
 (declare (salience 100))
(BSLT ?)
 =>
 (printout t crlf crlf
	"�����ֲ����Ժ�����" crlf
	"ѡ�� y / n -> ")
 (assert (YJJBMXHZ =(read))))

;****************************
;rule ckYJJBHZ:
;	���������ֲ�����
;****************************
 
(defrule ckYJJBHZ
 (declare (salience 100))
(YJJBMXHZ ?)
 =>
 (printout t crlf crlf
	"�����ֲ�������" crlf
	"ѡ�� y / n -> ")
 (assert (YJJBHZ =(read))))

;****************************
;rule ckDJYND:
;	���ʶ�����ŧ��
;****************************
 
(defrule ckDJYND
 (declare (salience 100))
(YJJBHZ ?)
 =>
 (printout t crlf crlf
	"������ŧ����" crlf
	"ѡ�� y / n -> ")
 (assert (DJYND =(read))))

;****************************
;rule ckSTBH:
;	������̦����
;****************************
 
(defrule ckSTBH
 (declare (salience 100))
(DJYND ?)
 =>
 (printout t crlf crlf
	"��̦������" crlf
	"ѡ�� y / n -> ")
 (assert (STBH =(read))))

;****************************
;rule ckWNC:
;	����θ�ɲ�
;****************************
 
(defrule ckWNC
 (declare (salience 100))
(STBH ?)
 =>
 (printout t crlf crlf
	"θ�ɲ���" crlf
	"ѡ�� y / n -> ")
 (assert (WNC =(read))))

;****************************
;rule ckNDPK:
;	����ŧ������
;****************************
 
(defrule ckNDPK
 (declare (salience 100))
(WNC ?)
 =>
 (printout t crlf crlf
	"ŧ��������" crlf
	"ѡ�� y / n -> ")
 (assert (NDPK =(read))))

;****************************

;****************************
;rule rule1:
;	����1
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
;	����2
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
;	����3
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
;	����4
;****************************
(defrule rule4a
  (declare(salience 99))
    (YJJBMXHZ y)
 =>
   (assert (ZX y)))

;****************************
;rule rule5:
;	����5
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
;	����6
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
;	����7
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
;	����8
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
;	����9
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
;	����10
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
;	����11
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
;	����12
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
;	����13
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
;	����14
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
;	��Ͻ��1������ɢ񮷨
;****************************
 
(defrule result1
  (declare (salience 96))
  (SLF y)
 =>
 (printout t crlf crlf
	"��Ͻ�������Բ���ɢ������" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result2:
;	��Ͻ��2���������ҩ��
;****************************
 
(defrule result2
  (declare (salience 96))
  (WFYW y)
 =>
 (printout t crlf crlf
	"��Ͻ�������Բ������ҩ�" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result3:
;	��Ͻ��3������ɢ���ӹ�
;****************************
 
(defrule result3
  (declare (salience 96))
  (SLJG y)
 =>
 (printout t crlf crlf
	"��Ͻ�������Բ���ɢ���ӹޡ�" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result4:
;	��Ͻ��4�����������ӹ�
;****************************
 
(defrule result4
  (declare (salience 96))
  (TLJG y)
 =>
 (printout t crlf crlf
	"��Ͻ�������Բ��������ӹޡ�" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule result5:
;	��Ͻ��5�����÷�Ѫ��
;****************************
 
(defrule result5
  (declare (salience 96))
  (FXF y)
 =>
 (printout t crlf crlf
	"��Ͻ�������Բ��÷�Ѫ����" crlf crlf)
 (assert (succeed)))

;****************************

;****************************
;rule resultSucceed:
;	����Ͻ��
;****************************
 
(defrule resultSucceed
  (declare (salience 95))
  (succeed)
 =>
 (printout t crlf crlf
	"��������Ͻ���������ѡ��" crlf crlf
        "1)������ϣ�"crlf
        "2)�˳�����"crlf
        "����������1��2:")
 (assert (choice_a =(read))))

;****************************

;****************************
;rule fail:
;	û����Ͻ��
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
	"û����Ͻ���������ѡ��" crlf crlf
        "1)������ϣ�"crlf
        "2)�˳�����"crlf
        "����������1��2:")
 (assert (choice_b =(read))))

;****************************

;****************************
;rule choice1a:
;	ѡ��1������Ͻ�����������
;****************************
 
(defrule choice1a
  (choice_a 1)
 =>
 (printout t crlf crlf crlf crlf
	"������ϣ�" crlf crlf)
 (reset))

;****************************

;****************************
;rule choice2a:
;	ѡ��2������Ͻ�����˳�����
;****************************

(defrule choice2a
(choice_a 2)
 =>
 (printout t crlf crlf crlf crlf
	"�˳�����" crlf crlf)
 (assert (stop)))

;****************************

;****************************
;rule choice1b:
;	ѡ��1��û����Ͻ�����������
;****************************
 
(defrule choice1b
  (choice_b 1)
 =>
 (printout t crlf crlf crlf crlf
	"������ϣ�" crlf crlf)
 (reset))

;****************************

;****************************
;rule choice2b:
;	ѡ��2��û����Ͻ�����˳�����
;****************************

(defrule choice2b
(choice_b 2)
 =>
 (printout t crlf crlf crlf crlf
	"�˳�����" crlf crlf)
 (assert (stop)))

;****************************