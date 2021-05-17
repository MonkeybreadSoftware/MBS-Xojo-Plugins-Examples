#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // a few checks to see if our matrix functions for DynaPDF produce same results as CoreGraphics
		  
		  // identity
		  Dim t As New DynaPDFMatrixMBS
		  Dim n As New NSAffineTransformMBS
		  Dim c As New CGAffineTransformMBS
		  
		  Compare t, n, c
		  
		  // init with some values
		  t = New DynaPDFMatrixMBS(1,2,3,4,5,6)
		  n = New NSAffineTransformMBS(1,2,3,4,5,6)
		  c = New CGAffineTransformMBS(1,2,3,4,5,6)
		  
		  Compare t, n, c
		  
		  t.Invert
		  n.invert
		  c = c.Invert
		  
		  Compare t, n, c
		  
		  // multiply
		  
		  Dim t1 As New DynaPDFMatrixMBS    (1,2,3,4,5,6)
		  Dim n1 As New NSAffineTransformMBS(1,2,3,4,5,6)
		  Dim c1 As New CGAffineTransformMBS(1,2,3,4,5,6)
		  
		  Dim t2 As New DynaPDFMatrixMBS    (2,3,4,5,6,7)
		  Dim n2 As New NSAffineTransformMBS(2,3,4,5,6,7)
		  Dim c2 As New CGAffineTransformMBS(2,3,4,5,6,7)
		  
		  Dim t3 As New DynaPDFMatrixMBS(t1)
		  t3.LeftMultiply(t2)
		  n1.appendTransform(n2)
		  Dim n3 As NSAffineTransformMBS = n1
		  Dim c3 As CGAffineTransformMBS = c1.Concat(c2)
		  
		  Compare t3, n3, c3
		  
		  // multiply with *
		  
		  t1 = New DynaPDFMatrixMBS    (1,2,3,4,5,6)
		  n1 = New NSAffineTransformMBS(1,2,3,4,5,6)
		  c1 = New CGAffineTransformMBS(1,2,3,4,5,6)
		  
		  t2 = New DynaPDFMatrixMBS    (2,3,4,5,6,7)
		  n2 = New NSAffineTransformMBS(2,3,4,5,6,7)
		  c2 = New CGAffineTransformMBS(2,3,4,5,6,7)
		  
		  t3 = t1 * t2
		  n3 = n1 * n2
		  c3 = c1 * c2
		  
		  Compare t3, n3, c3
		  
		  // rotate
		  
		  t1 = New DynaPDFMatrixMBS    (1,2,3,4,5,6)
		  n1 = New NSAffineTransformMBS(1,2,3,4,5,6)
		  c1 = New CGAffineTransformMBS(1,2,3,4,5,6)
		  
		  // 1.0/3,14*180 is about 57°
		  
		  t2 = New DynaPDFMatrixMBS(t1)
		  t2.Rotate(1)
		  n2 = New NSAffineTransformMBS(n1)
		  n2.rotateByRadians(1)
		  c2 = c1.Rotate(1)
		  
		  Compare t2, n2, c2
		  
		  // scale
		  
		  t1 = New DynaPDFMatrixMBS    (1,2,3,4,5,6)
		  n1 = New NSAffineTransformMBS(1,2,3,4,5,6)
		  c1 = New CGAffineTransformMBS(1,2,3,4,5,6)
		  
		  t2 = New DynaPDFMatrixMBS(t1)
		  t2.Scale(3,4)
		  n2 = New NSAffineTransformMBS(n1)
		  n2.scale(3,4)
		  c2 = c1.Scale(3,4)
		  
		  Compare t2, n2, c2
		  
		  // translate
		  
		  t1 = New DynaPDFMatrixMBS    (1,2,3,4,5,6)
		  n1 = New NSAffineTransformMBS(1,2,3,4,5,6)
		  c1 = New CGAffineTransformMBS(1,2,3,4,5,6)
		  
		  t2 = New DynaPDFMatrixMBS(t1)
		  t2.Translate(3,4)
		  n2 = New NSAffineTransformMBS(n1)
		  n2.Translate(3,4)
		  c2 = c1.Translate(3,4)
		  
		  Compare t2, n2, c2
		  
		  Break // all fine if no breakpoint hits before this one
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Compare(t as DynaPDFMatrixMBS, n as NSAffineTransformMBS, g as CGAffineTransformMBS)
		  Dim ts As String = t
		  Dim ns As String = n
		  Dim gs As String = g
		  
		  'If ts <> ns Then Break
		  'If ts <> gs Then Break
		  'If gs <> ns Then Break
		  
		  dim e as Double = 0.000001
		  
		  If Abs(t.a - n.m11) > e Then Break
		  If Abs(t.b - n.m12) > e Then Break
		  If Abs(t.c - n.m21) > e Then Break
		  If Abs(t.d - n.m22) > e Then Break
		  If Abs(t.x - n.tx)  > e Then Break
		  If Abs(t.y - n.ty)  > e Then Break
		  
		  If Abs(t.a - g.a)  > e Then Break
		  If Abs(t.b - g.b)  > e Then Break
		  If Abs(t.c - g.c)  > e Then Break
		  If Abs(t.d - g.d)  > e Then Break
		  If Abs(t.x - g.tx) > e Then Break
		  If Abs(t.y - g.ty) > e Then Break
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
