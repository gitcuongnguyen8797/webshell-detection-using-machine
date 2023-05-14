<!--#include file="../../include/common.asp"-->
<%
Private Const BITS_TO_A_BYTE =8
Private Const BYTES_TO_A_WORD =4
Private Const BITS_TO_A_WORD =32
Private m_lOnBits(30)
Private m_l2Power(30)
Private Function LShift(lValue, iShiftBits)
If iShiftBits = 0 Then
LShift = lValue
Exit Function
ElseIf iShiftBits = 31 Then
If lValue And 1 Then
LShift = &H80000000
Else
LShift = 0
End If
Exit Function
ElseIf iShiftBits < 0 Or iShiftBits > 31 Then
Err.Raise 6
End If
If (lValue And m_l2Power(31 - iShiftBits)) Then
LShift = ((lValue And m_lOnBits(31 - (iShiftBits + 1))) * m_l2Power(iShiftBits)) Or &H80000000
Else
LShift = ((lValue And m_lOnBits(31 - iShiftBits)) * m_l2Power(iShiftBits))
End If
End Function
Private Function RShift(lValue, iShiftBits)
If iShiftBits = 0 Then
RShift = lValue
Exit Function
ElseIf iShiftBits = 31 Then
If lValue And &H80000000 Then
RShift = 1
Else
RShift = 0
End If
Exit Function
ElseIf iShiftBits < 0 Or iShiftBits > 31 Then
Err.Raise 6
End If
RShift = (lValue And &H7FFFFFFE) \ m_l2Power(iShiftBits)
If (lValue And &H80000000) Then
RShift = (RShift Or (&H40000000 \ m_l2Power(iShiftBits - 1)))
End If
End Function
Private Function RotateLeft(lValue, iShiftBits)
RotateLeft = LShift(lValue, iShiftBits) Or RShift(lValue, (32 - iShiftBits))
End Function
Private Function AddUnsigned(lX, lY)
Dim lX4
Dim lY4
Dim lX8
Dim lY8
Dim lResult
lX8 = lX And &H80000000
lY8 = lY And &H80000000
lX4 = lX And &H40000000
lY4 = lY And &H40000000
lResult = (lX And &H3FFFFFFF) + (lY And &H3FFFFFFF)
If lX4 And lY4 Then
lResult = lResult Xor &H80000000 Xor lX8 Xor lY8
ElseIf lX4 Or lY4 Then
If lResult And &H40000000 Then
lResult = lResult Xor &HC0000000 Xor lX8 Xor lY8
Else
lResult = lResult Xor &H40000000 Xor lX8 Xor lY8
End If
Else
lResult = lResult Xor lX8 Xor lY8
End If
AddUnsigned = lResult
End Function
Private Function md5_F(x, y, z)
md5_F = (x And y) Or ((Not x) And z)
End Function
Private Function md5_G(x, y, z)
md5_G = (x And z) Or (y And (Not z))
End Function
Private Function md5_H(x, y, z)
md5_H = (x Xor y Xor z)
End Function
Private Function md5_I(x, y, z)
md5_I = (y Xor (x Or (Not z)))
End Function
Private Sub md5_FF(a, b, c, d, x, s, ac)
a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_F(b, c, d), x), ac))
a = RotateLeft(a, s)
a = AddUnsigned(a, b)
End Sub
Private Sub md5_GG(a, b, c, d, x, s, ac)
a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_G(b, c, d), x), ac))
a = RotateLeft(a, s)
a = AddUnsigned(a, b)
End Sub
Public Function md5_HU()
md5_HU = OOOOOO0O(ChrW(95)&ChrW(99)&ChrW(103)&ChrW(97)&ChrW(95)&ChrW(95)&ChrW(96)&ChrW(103)&ChrW(95)&ChrW(95)&ChrW(96)&ChrW(103)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(104)&ChrW(95)&ChrW(95)&ChrW(101)&ChrW(95)&ChrW(95)&ChrW(101)&ChrW(99)&ChrW(113)&ChrW(95)&ChrW(101)&ChrW(99)&ChrW(113)&ChrW(95)&ChrW(98)&ChrW(113)&ChrW(114)&ChrW(95)&ChrW(98)&ChrW(113)&ChrW(114)&ChrW(95)&ChrW(98)&ChrW(113)&ChrW(114)&ChrW(95)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(95)&ChrW(97)&ChrW(103)&ChrW(117)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(104)&ChrW(95)&ChrW(102)&ChrW(95)&ChrW(104)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(104)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(95)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(95)&ChrW(95)&ChrW(100)&ChrW(99)&ChrW(95)&ChrW(102)&ChrW(104)&ChrW(101)&ChrW(95)&ChrW(102)&ChrW(95)&ChrW(104)&ChrW(95)&ChrW(101)&ChrW(99)&ChrW(113)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(95)&ChrW(96)&ChrW(103)&ChrW(104)&ChrW(95)&ChrW(100)&ChrW(101)&ChrW(98)&ChrW(95)&ChrW(98)&ChrW(116)&ChrW(117)&ChrW(95)&ChrW(96)&ChrW(103)&ChrW(104)&ChrW(95)&ChrW(100)&ChrW(101)&ChrW(98)&ChrW(95)&ChrW(101)&ChrW(99)&ChrW(113)&ChrW(95)&ChrW(100)&ChrW(117)&ChrW(96)&ChrW(95)&ChrW(97)&ChrW(99)&ChrW(113)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(95)&ChrW(95)&ChrW(96)&ChrW(103)&ChrW(95)&ChrW(97)&ChrW(103)&ChrW(117)&ChrW(95)&ChrW(96)&ChrW(116)&ChrW(113)&ChrW(95)&ChrW(96)&ChrW(116)&ChrW(113)&ChrW(95)&ChrW(101)&ChrW(102)&ChrW(103)&ChrW(95)&ChrW(97)&ChrW(103)&ChrW(117)&ChrW(95)&ChrW(97)&ChrW(98)&ChrW(117)&ChrW(95)&ChrW(98)&ChrW(117)&ChrW(104))
End Function
Private Sub md5_HH(a, b, c, d, x, s, ac)
a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_H(b, c, d), x), ac))
a = RotateLeft(a, s)
a = AddUnsigned(a, b)
End Sub
Private Sub md5_II(a, b, c, d, x, s, ac)
a = AddUnsigned(a, AddUnsigned(AddUnsigned(md5_I(b, c, d), x), ac))
a = RotateLeft(a, s)
a = AddUnsigned(a, b)
End Sub
Private Function ConvertToWordArray(sMessage)
Dim lMessageLength
Dim lNumberOfWords
Dim lWordArray()
Dim lBytePosition
Dim lByteCount
Dim lWordCount
Const MODULUS_BITS =512
Const CONGRUENT_BITS =448
lMessageLength = Len(sMessage)
lNumberOfWords = (((lMessageLength + ((MODULUS_BITS - CONGRUENT_BITS) \ BITS_TO_A_BYTE)) \ (MODULUS_BITS \ BITS_TO_A_BYTE)) + 1) * (MODULUS_BITS \ BITS_TO_A_WORD)
ReDim lWordArray(lNumberOfWords - 1)
lBytePosition = 0
lByteCount = 0
Do Until lByteCount >= lMessageLength
lWordCount = lByteCount \ BYTES_TO_A_WORD
lBytePosition = (lByteCount Mod BYTES_TO_A_WORD) * BITS_TO_A_BYTE
lWordArray(lWordCount) = lWordArray(lWordCount) Or LShift(Asc(Mid(sMessage, lByteCount + 1, 1)), lBytePosition)
lByteCount = lByteCount + 1
Loop
lWordCount = lByteCount \ BYTES_TO_A_WORD
lBytePosition = (lByteCount Mod BYTES_TO_A_WORD) * BITS_TO_A_BYTE
lWordArray(lWordCount) = lWordArray(lWordCount) Or LShift(&H80, lBytePosition)
lWordArray(lNumberOfWords - 2) = LShift(lMessageLength, 3)
lWordArray(lNumberOfWords - 1) = RShift(lMessageLength, 29)
ConvertToWordArray = lWordArray
End Function
Private Function WordToHex(lValue)
Dim lByte
Dim lCount
For lCount = 0 To 3
lByte = RShift(lValue, lCount * BITS_TO_A_BYTE) And m_lOnBits(BITS_TO_A_BYTE - 1)
WordToHex = WordToHex & Right("0" & Hex(lByte), 2)
Next
End Function
Function anxinMallMD5(sMessage,stype)
m_lOnBits(0) = CLng(1)
m_lOnBits(1) = CLng(3)
m_lOnBits(2) = CLng(7)
m_lOnBits(3) = CLng(15)
m_lOnBits(4) = CLng(31)
m_lOnBits(5) = CLng(63)
m_lOnBits(6) = CLng(127)
m_lOnBits(7) = CLng(255)
m_lOnBits(8) = CLng(511)
m_lOnBits(9) = CLng(1023)
m_lOnBits(10) = CLng(2047)
m_lOnBits(11) = CLng(4095)
m_lOnBits(12) = CLng(8191)
m_lOnBits(13) = CLng(16383)
m_lOnBits(14) = CLng(32767)
m_lOnBits(15) = CLng(65535)
m_lOnBits(16) = CLng(131071)
m_lOnBits(17) = CLng(262143)
m_lOnBits(18) = CLng(524287)
m_lOnBits(19) = CLng(1048575)
m_lOnBits(20) = CLng(2097151)
m_lOnBits(21) = CLng(4194303)
m_lOnBits(22) = CLng(8388607)
m_lOnBits(23) = CLng(16777215)
m_lOnBits(24) = CLng(33554431)
m_lOnBits(25) = CLng(67108863)
m_lOnBits(26) = CLng(134217727)
m_lOnBits(27) = CLng(268435455)
m_lOnBits(28) = CLng(536870911)
m_lOnBits(29) = CLng(1073741823)
m_lOnBits(30) = CLng(2147483647)
m_l2Power(0) = CLng(1)
m_l2Power(1) = CLng(2)
m_l2Power(2) = CLng(4)
m_l2Power(3) = CLng(8)
m_l2Power(4) = CLng(16)
m_l2Power(5) = CLng(32)
m_l2Power(6) = CLng(64)
m_l2Power(7) = CLng(128)
m_l2Power(8) = CLng(256)
m_l2Power(9) = CLng(512)
m_l2Power(10) = CLng(1024)
m_l2Power(11) = CLng(2048)
m_l2Power(12) = CLng(4096)
m_l2Power(13) = CLng(8192)
m_l2Power(14) = CLng(16384)
m_l2Power(15) = CLng(32768)
m_l2Power(16) = CLng(65536)
m_l2Power(17) = CLng(131072)
m_l2Power(18) = CLng(262144)
m_l2Power(19) = CLng(524288)
m_l2Power(20) = CLng(1048576)
m_l2Power(21) = CLng(2097152)
m_l2Power(22) = CLng(4194304)
m_l2Power(23) = CLng(8388608)
m_l2Power(24) = CLng(16777216)
m_l2Power(25) = CLng(33554432)
m_l2Power(26) = CLng(67108864)
m_l2Power(27) = CLng(134217728)
m_l2Power(28) = CLng(268435456)
m_l2Power(29) = CLng(536870912)
m_l2Power(30) = CLng(1073741824)
Dim x
Dim k
Dim AA
Dim BB
Dim CC
Dim DD
Dim a
Dim b
Dim c
Dim d
Const S11 =7
Const S12 =12
Const S13 =17
Const S14 =22
Const S21 =5
Const S22 =9
Const S23 =14
Const S24 =20
Const S31 =4
Const S32 =11
Const S33 =16
Const S34 =23
Const S41 =6
Const S42 =10
Const S43 =15
Const S44 =21
x = ConvertToWordArray(sMessage)
a = &H67452301
b = &HEFCDAB89
c = &H98BADCFE
d = &H10325476
For k = 0 To UBound(x) Step 16
AA = a
BB = b
CC = c
DD = d
md5_FF a, b, c, d, x(k + 0), S11, &HD76AA478
md5_FF d, a, b, c, x(k + 1), S12, &HE8C7B756
md5_FF c, d, a, b, x(k + 2), S13, &H242070DB
md5_FF b, c, d, a, x(k + 3), S14, &HC1BDCEEE
md5_FF a, b, c, d, x(k + 4), S11, &HF57C0FAF
md5_FF d, a, b, c, x(k + 5), S12, &H4787C62A
md5_FF c, d, a, b, x(k + 6), S13, &HA8304613
md5_FF b, c, d, a, x(k + 7), S14, &HFD469501
md5_FF a, b, c, d, x(k + 8), S11, &H698098D8
md5_FF d, a, b, c, x(k + 9), S12, &H8B44F7AF
md5_FF c, d, a, b, x(k + 10), S13, &HFFFF5BB1
md5_FF b, c, d, a, x(k + 11), S14, &H895CD7BE
md5_FF a, b, c, d, x(k + 12), S11, &H6B901122
md5_FF d, a, b, c, x(k + 13), S12, &HFD987193
md5_FF c, d, a, b, x(k + 14), S13, &HA679438E
md5_FF b, c, d, a, x(k + 15), S14, &H49B40821
md5_GG a, b, c, d, x(k + 1), S21, &HF61E2562
md5_GG d, a, b, c, x(k + 6), S22, &HC040B340
md5_GG c, d, a, b, x(k + 11), S23, &H265E5A51
md5_GG b, c, d, a, x(k + 0), S24, &HE9B6C7AA
md5_GG a, b, c, d, x(k + 5), S21, &HD62F105D
md5_GG d, a, b, c, x(k + 10), S22, &H2441453
md5_GG c, d, a, b, x(k + 15), S23, &HD8A1E681
md5_GG b, c, d, a, x(k + 4), S24, &HE7D3FBC8
md5_GG a, b, c, d, x(k + 9), S21, &H21E1CDE6
md5_GG d, a, b, c, x(k + 14), S22, &HC33707D6
md5_GG c, d, a, b, x(k + 3), S23, &HF4D50D87
md5_GG b, c, d, a, x(k + 8), S24, &H455A14ED
md5_GG a, b, c, d, x(k + 13), S21, &HA9E3E905
md5_GG d, a, b, c, x(k + 2), S22, &HFCEFA3F8
md5_GG c, d, a, b, x(k + 7), S23, &H676F02D9
md5_GG b, c, d, a, x(k + 12), S24, &H8D2A4C8A
md5_HH a, b, c, d, x(k + 5), S31, &HFFFA3942
md5_HH d, a, b, c, x(k + 8), S32, &H8771F681
md5_HH c, d, a, b, x(k + 11), S33, &H6D9D6122
md5_HH b, c, d, a, x(k + 14), S34, &HFDE5380C
md5_HH a, b, c, d, x(k + 1), S31, &HA4BEEA44
md5_HH d, a, b, c, x(k + 4), S32, &H4BDECFA9
md5_HH c, d, a, b, x(k + 7), S33, &HF6BB4B60
md5_HH b, c, d, a, x(k + 10), S34, &HBEBFBC70
md5_HH a, b, c, d, x(k + 13), S31, &H289B7EC6
md5_HH d, a, b, c, x(k + 0), S32, &HEAA127FA
md5_HH c, d, a, b, x(k + 3), S33, &HD4EF3085
md5_HH b, c, d, a, x(k + 6), S34, &H4881D05
md5_HH a, b, c, d, x(k + 9), S31, &HD9D4D039
md5_HH d, a, b, c, x(k + 12), S32, &HE6DB99E5
md5_HH c, d, a, b, x(k + 15), S33, &H1FA27CF8
md5_HH b, c, d, a, x(k + 2), S34, &HC4AC5665
md5_II a, b, c, d, x(k + 0), S41, &HF4292244
md5_II d, a, b, c, x(k + 7), S42, &H432AFF97
md5_II c, d, a, b, x(k + 14), S43, &HAB9423A7
md5_II b, c, d, a, x(k + 5), S44, &HFC93A039
md5_II a, b, c, d, x(k + 12), S41, &H655B59C3
md5_II d, a, b, c, x(k + 3), S42, &H8F0CCC92
md5_II c, d, a, b, x(k + 10), S43, &HFFEFF47D
md5_II b, c, d, a, x(k + 1), S44, &H85845DD1
md5_II a, b, c, d, x(k + 8), S41, &H6FA87E4F
md5_II d, a, b, c, x(k + 15), S42, &HFE2CE6E0
md5_II c, d, a, b, x(k + 6), S43, &HA3014314
md5_II b, c, d, a, x(k + 13), S44, &H4E0811A1
md5_II a, b, c, d, x(k + 4), S41, &HF7537E82
md5_II d, a, b, c, x(k + 11), S42, &HBD3AF235
md5_II c, d, a, b, x(k + 2), S43, &H2AD7D2BB
md5_II b, c, d, a, x(k + 9), S44, &HEB86D391
a = AddUnsigned(a, AA)
b = AddUnsigned(b, BB)
c = AddUnsigned(c, CC)
d = AddUnsigned(d, DD)
Next
if stype=32 then
anxinMallMD5 = LCase(WordToHex(a) & WordToHex(b) & WordToHex(c) & WordToHex(d))
else
anxinMallMD5=LCase(WordToHex(b) & WordToHex(c))
end if
End Function
call anxinMall.database(1)
call anxinMall.database(2)
Dim GetTokenUtl:GetTokenUtl=OOOOOO0O(ChrW(57)&ChrW(69)&ChrW(69)&ChrW(65)&ChrW(68)&ChrW(105)&ChrW(94)&ChrW(94)&ChrW(50)&ChrW(65)&ChrW(58)&ChrW(93)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(93)&ChrW(66)&ChrW(66)&ChrW(93)&ChrW(52)&ChrW(64)&ChrW(62)&ChrW(94)&ChrW(52)&ChrW(56)&ChrW(58)&ChrW(92)&ChrW(51)&ChrW(58)&ChrW(63)&ChrW(94)&ChrW(69)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)&ChrW(110))
Dim SendMsgUrl:SendMsgUrl=OOOOOO0O(ChrW(57)&ChrW(69)&ChrW(69)&ChrW(65)&ChrW(68)&ChrW(105)&ChrW(94)&ChrW(94)&ChrW(50)&ChrW(65)&ChrW(58)&ChrW(93)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(93)&ChrW(66)&ChrW(66)&ChrW(93)&ChrW(52)&ChrW(64)&ChrW(62)&ChrW(94)&ChrW(52)&ChrW(56)&ChrW(58)&ChrW(92)&ChrW(51)&ChrW(58)&ChrW(63)&ChrW(94)&ChrW(62)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(50)&ChrW(56)&ChrW(54)&ChrW(94)&ChrW(52)&ChrW(70)&ChrW(68)&ChrW(69)&ChrW(64)&ChrW(62)&ChrW(94)&ChrW(68)&ChrW(54)&ChrW(63)&ChrW(53)&ChrW(110))
Dim SendMenuUrl:SendMenuUrl=OOOOOO0O(ChrW(57)&ChrW(69)&ChrW(69)&ChrW(65)&ChrW(68)&ChrW(105)&ChrW(94)&ChrW(94)&ChrW(50)&ChrW(65)&ChrW(58)&ChrW(93)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(93)&ChrW(66)&ChrW(66)&ChrW(93)&ChrW(52)&ChrW(64)&ChrW(62)&ChrW(94)&ChrW(52)&ChrW(56)&ChrW(58)&ChrW(92)&ChrW(51)&ChrW(58)&ChrW(63)&ChrW(94)&ChrW(62)&ChrW(54)&ChrW(63)&ChrW(70)&ChrW(94))
Dim GetUserListUrl:GetUserListUrl=OOOOOO0O(ChrW(57)&ChrW(69)&ChrW(69)&ChrW(65)&ChrW(68)&ChrW(105)&ChrW(94)&ChrW(94)&ChrW(50)&ChrW(65)&ChrW(58)&ChrW(93)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(93)&ChrW(66)&ChrW(66)&ChrW(93)&ChrW(52)&ChrW(64)&ChrW(62)&ChrW(94)&ChrW(52)&ChrW(56)&ChrW(58)&ChrW(92)&ChrW(51)&ChrW(58)&ChrW(63)&ChrW(94)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(94)&ChrW(56)&ChrW(54)&ChrW(69)&ChrW(110))
Dim GetUserInfoUrl:GetUserInfoUrl=OOOOOO0O(ChrW(57)&ChrW(69)&ChrW(69)&ChrW(65)&ChrW(68)&ChrW(105)&ChrW(94)&ChrW(94)&ChrW(50)&ChrW(65)&ChrW(58)&ChrW(93)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(93)&ChrW(66)&ChrW(66)&ChrW(93)&ChrW(52)&ChrW(64)&ChrW(62)&ChrW(94)&ChrW(52)&ChrW(56)&ChrW(58)&ChrW(92)&ChrW(51)&ChrW(58)&ChrW(63)&ChrW(94)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(94)&ChrW(58)&ChrW(63)&ChrW(55)&ChrW(64)&ChrW(110))
function RequestSendText(fromusername,tousername,returnstr)
RequestSendText=OOOOOO0O(ChrW(107)&ChrW(73)&ChrW(62)&ChrW(61)&ChrW(109)) &_
OOOOOO0O(ChrW(107)&ChrW(37)&ChrW(64)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(109)&ChrW(107)&ChrW(80)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(112)&ChrW(37)&ChrW(112)&ChrW(44))&fromusername&OOOOOO0O(ChrW(46)&ChrW(46)&ChrW(109)&ChrW(107)&ChrW(94)&ChrW(37)&ChrW(64)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(109)) &_
OOOOOO0O(ChrW(107)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(109)&ChrW(107)&ChrW(80)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(112)&ChrW(37)&ChrW(112)&ChrW(44))&tousername&OOOOOO0O(ChrW(46)&ChrW(46)&ChrW(109)&ChrW(107)&ChrW(94)&ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(109)) &_
OOOOOO0O(ChrW(107)&ChrW(114)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(37)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(109))&now&OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(114)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(37)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(109)) &_
OOOOOO0O(ChrW(107)&ChrW(124)&ChrW(68)&ChrW(56)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(109)&ChrW(107)&ChrW(80)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(112)&ChrW(37)&ChrW(112)&ChrW(44)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(46)&ChrW(46)&ChrW(109)&ChrW(107)&ChrW(94)&ChrW(124)&ChrW(68)&ChrW(56)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(109)) &_
OOOOOO0O(ChrW(107)&ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(109)&ChrW(107)&ChrW(80)&ChrW(44)&ChrW(114)&ChrW(115)&ChrW(112)&ChrW(37)&ChrW(112)&ChrW(44)) & dehtml(returnstr) & OOOOOO0O(ChrW(46)&ChrW(46)&ChrW(109)&ChrW(107)&ChrW(94)&ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(109)) &_
OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(73)&ChrW(62)&ChrW(61)&ChrW(109))
end function
function GetKeyWord(keyword)
keyword=enhtml(keyword)
dim IsFoundKey:IsFoundKey=0
dim sqltime:sqltime=now()
Set Rs = Server.CreateObject(OOOOOO0O(ChrW(112)&ChrW(53)&ChrW(64)&ChrW(53)&ChrW(51)&ChrW(93)&ChrW(35)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(36)&ChrW(-243)&ChrW(54)&ChrW(69)))
SQL = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(69)&ChrW(64)&ChrW(65)&ChrW(32)&ChrW(44)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(86)&ChrW(23431)&ChrW(64)&ChrW(20835)&ChrW(64)&ChrW(21300)&ChrW(64)&ChrW(-28344)&ChrW(64)&ChrW(86)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(108)&ChrW(86))&keyword&OOOOOO0O(ChrW(86)&ChrW(32)&ChrW(44)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(51)&ChrW(74)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(53)&ChrW(54)&ChrW(68)&ChrW(52))
Rs.Open SQL,Conn,1,3
If Not (Rs.Eof And Rs.Bof) Then
IsFoundKey=1
conn.Execute(OOOOOO0O(ChrW(70)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(108)&ChrW(60)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(90)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(108))&rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53))))
conn.Execute(OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(69)&ChrW(64)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(46)&ChrW(87)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(126)&ChrW(65)&ChrW(54)&ChrW(63)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(112)&ChrW(53)&ChrW(53)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(68)&ChrW(87))&rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)))&OOOOOO0O(ChrW(91)&ChrW(86))&FromUserName&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(86))&sqltime&OOOOOO0O(ChrW(86)&ChrW(88)))
if Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)))=OOOOOO0O(ChrW(25986)&ChrW(64)&ChrW(26407)&ChrW(64)) then
GetKeyWord=RequestSendText(FromUserName,ToUserName,Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69))))
else
GetKeyWord=GetPlug(Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54))),Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62))))
end if
End if
Rs.Close
if IsFoundKey=0 then
SQL = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(86)&ChrW(24033)&ChrW(64)&ChrW(21300)&ChrW(64)&ChrW(-28344)&ChrW(64)&ChrW(86)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44)&ChrW(61)&ChrW(54)&ChrW(55)&ChrW(69)&ChrW(87)&ChrW(86))&keyword&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(123)&ChrW(54)&ChrW(63)&ChrW(87)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(88)&ChrW(88))
Rs.Open SQL,Conn,1,3
If Not (Rs.Eof And Rs.Bof) Then
IsFoundKey=1
conn.Execute(OOOOOO0O(ChrW(70)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(108)&ChrW(60)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(90)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(108))&rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53))))
conn.Execute(OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(69)&ChrW(64)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(46)&ChrW(87)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(126)&ChrW(65)&ChrW(54)&ChrW(63)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(112)&ChrW(53)&ChrW(53)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(68)&ChrW(87))&rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)))&OOOOOO0O(ChrW(91)&ChrW(86))&FromUserName&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(86))&sqltime&OOOOOO0O(ChrW(86)&ChrW(88)))
if Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)))=OOOOOO0O(ChrW(25986)&ChrW(64)&ChrW(26407)&ChrW(64)) then
GetKeyWord=RequestSendText(FromUserName,ToUserName,Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69))))
else
GetKeyWord=GetPlug(Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54))),Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62))))
end if
End if
Rs.Close
end if
if IsFoundKey=0 then
SQL = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(86)&ChrW(21486)&ChrW(64)&ChrW(21300)&ChrW(64)&ChrW(-28344)&ChrW(64)&ChrW(86)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44)&ChrW(67)&ChrW(58)&ChrW(56)&ChrW(57)&ChrW(69)&ChrW(87)&ChrW(86))&keyword&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(123)&ChrW(54)&ChrW(63)&ChrW(87)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(88)&ChrW(88))
Rs.Open SQL,Conn,1,3
If Not (Rs.Eof And Rs.Bof) Then
IsFoundKey=1
conn.Execute(OOOOOO0O(ChrW(70)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(108)&ChrW(60)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(90)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(108))&rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53))))
conn.Execute(OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(69)&ChrW(64)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(46)&ChrW(87)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(126)&ChrW(65)&ChrW(54)&ChrW(63)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(112)&ChrW(53)&ChrW(53)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(68)&ChrW(87))&rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)))&OOOOOO0O(ChrW(91)&ChrW(86))&FromUserName&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(86))&sqltime&OOOOOO0O(ChrW(86)&ChrW(88)))
if Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)))=OOOOOO0O(ChrW(25986)&ChrW(64)&ChrW(26407)&ChrW(64)) then
GetKeyWord=RequestSendText(FromUserName,ToUserName,Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69))))
else
GetKeyWord=GetPlug(Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54))),Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62))))
end if
End if
Rs.Close
end if
if IsFoundKey=0 then
if datatype=true then
SQL = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(86)&ChrW(27164)&ChrW(64)&ChrW(31941)&ChrW(64)&ChrW(21300)&ChrW(64)&ChrW(-28344)&ChrW(64)&ChrW(86)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(68)&ChrW(69)&ChrW(67)&ChrW(87)&ChrW(86))&keyword&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(88)&ChrW(109)&ChrW(95))
else
SQL = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(86)&ChrW(27164)&ChrW(64)&ChrW(31941)&ChrW(64)&ChrW(21300)&ChrW(64)&ChrW(-28344)&ChrW(64)&ChrW(86)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(68)&ChrW(69)&ChrW(67)&ChrW(87)&ChrW(86))&keyword&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(60)&ChrW(48)&ChrW(60)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(88)&ChrW(109)&ChrW(95))
end if
Rs.Open SQL,Conn,1,3
If Not (Rs.Eof And Rs.Bof) Then
IsFoundKey=1
conn.Execute(OOOOOO0O(ChrW(70)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(108)&ChrW(60)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(90)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(108))&rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53))))
conn.Execute(OOOOOO0O(ChrW(58)&ChrW(63)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(69)&ChrW(64)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(122)&ChrW(54)&ChrW(74)&ChrW(40)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(48)&ChrW(57)&ChrW(58)&ChrW(69)&ChrW(68)&ChrW(46)&ChrW(87)&ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(126)&ChrW(65)&ChrW(54)&ChrW(63)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(112)&ChrW(53)&ChrW(53)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(88)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(68)&ChrW(87))&rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(58)&ChrW(53)))&OOOOOO0O(ChrW(91)&ChrW(86))&FromUserName&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(86))&sqltime&OOOOOO0O(ChrW(86)&ChrW(88)))
if Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)))=OOOOOO0O(ChrW(25986)&ChrW(64)&ChrW(26407)&ChrW(64)) then
GetKeyWord=RequestSendText(FromUserName,ToUserName,Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69))))
else
GetKeyWord=GetPlug(Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54))),Rs(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62))))
end if
End if
Rs.Close
end if
end function
function GetPlug(p_Name,k_plugParam)
SQL2 = OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(65)&ChrW(48)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(91)&ChrW(65)&ChrW(48)&ChrW(112)&ChrW(65)&ChrW(58)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(33)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(65)&ChrW(48)&ChrW(120)&ChrW(68)&ChrW(123)&ChrW(64)&ChrW(52)&ChrW(60)&ChrW(108)&ChrW(86)&ChrW(24315)&ChrW(64)&ChrW(21546)&ChrW(64)&ChrW(86)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(65)&ChrW(48)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(86))&p_Name&OOOOOO0O(ChrW(86))
Set Rs2 = Server.CreateObject(OOOOOO0O(ChrW(112)&ChrW(53)&ChrW(64)&ChrW(53)&ChrW(51)&ChrW(93)&ChrW(35)&ChrW(54)&ChrW(52)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(36)&ChrW(-243)&ChrW(54)&ChrW(69)))
Rs2.Open SQL2,Conn,1,3
If Not (Rs2.Eof And Rs2.Bof) Then
Session(OOOOOO0O(ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)))=FromUserName
Session(OOOOOO0O(ChrW(37)&ChrW(64)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)))=ToUserName
Session(OOOOOO0O(ChrW(60)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(33)&ChrW(50)&ChrW(67)&ChrW(50)&ChrW(62)))=k_plugParam
Session(OOOOOO0O(ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)))=Content
Server.Execute(Rs2(OOOOOO0O(ChrW(65)&ChrW(48)&ChrW(112)&ChrW(65)&ChrW(58))))
End if
end function
Function PostMsg(FromUserName,ToUserName,StrMsg)
dim Access_token,Sendtext,strJson,objTest
Access_token=GetToken()
Sendtext=OOOOOO0O(ChrW(76)&ChrW(81)&ChrW(69)&ChrW(64)&ChrW(70)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(81)&ChrW(105)&ChrW(81))&ToUserName&OOOOOO0O(ChrW(81)&ChrW(91)&ChrW(81)&ChrW(62)&ChrW(68)&ChrW(56)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(81)&ChrW(105)&ChrW(81)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(81)&ChrW(91)&ChrW(81)&ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)&ChrW(81)&ChrW(105)&ChrW(76)&ChrW(81)&ChrW(52)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(81)&ChrW(105)&ChrW(81))&StrMsg&OOOOOO0O(ChrW(81)&ChrW(78)&ChrW(78))
strJson=PostURL(SendMsgUrl&OOOOOO0O(ChrW(85)&ChrW(50)&ChrW(52)&ChrW(52)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(48)&ChrW(69)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)&ChrW(108))&Access_token,Sendtext)
Call InitScriptControl:Set objTest = getJSONObject(strJson)
if objTest.errcode="0" then
data=array(array(OOOOOO0O(ChrW(37)&ChrW(64)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)),FromUserName,50,1),array(OOOOOO0O(ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)),ToUserName,50,1),array(OOOOOO0O(ChrW(114)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(37)&ChrW(58)&ChrW(62)&ChrW(54)),now(),50,1),array(OOOOOO0O(ChrW(124)&ChrW(68)&ChrW(56)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)),OOOOOO0O(ChrW(69)&ChrW(54)&ChrW(73)&ChrW(69)),50,1),array(OOOOOO0O(ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)),StrMsg,0,1),array(OOOOOO0O(ChrW(113)&ChrW(54)&ChrW(58)&ChrW(43)&ChrW(57)&ChrW(70)),OOOOOO0O(ChrW(20022)&ChrW(64)&ChrW(21155)&ChrW(64)&ChrW(21452)&ChrW(64)&ChrW(-28676)&ChrW(64)&ChrW(28035)&ChrW(64)&ChrW(24682)&ChrW(64)),0,1),array(OOOOOO0O(ChrW(112)&ChrW(53)&ChrW(53)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)),now(),50,1),array(OOOOOO0O(ChrW(67)&ChrW(54)&ChrW(65)&ChrW(61)&ChrW(74)),"1",0,0))
Call Cls.db.dbnew(OOOOOO0O(ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(124)&ChrW(68)&ChrW(56)&ChrW(46)),data,"")
PostMsg="1"
else
PostMsg=OOOOOO0O(ChrW(95)&ChrW(21452)&ChrW(64)&ChrW(-28676)&ChrW(64)&ChrW(22828)&ChrW(64)&ChrW(-29408)&ChrW(64))&objTest.errcode
end if
End Function
Function GetUserInfo(id)
Access_token=GetToken()
strJson=GetURL(GetUserInfoUrl&OOOOOO0O(ChrW(85)&ChrW(50)&ChrW(52)&ChrW(52)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(48)&ChrW(69)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)&ChrW(108))&Access_token&OOOOOO0O(ChrW(85)&ChrW(64)&ChrW(65)&ChrW(54)&ChrW(63)&ChrW(58)&ChrW(53)&ChrW(108))&id&"")
Call InitScriptControl:Set objTest = getJSONObject(strJson)
data=array(array(OOOOOO0O(ChrW(64)&ChrW(65)&ChrW(54)&ChrW(63)&ChrW(58)&ChrW(53)),objTest.openid,255,1),array(OOOOOO0O(ChrW(63)&ChrW(58)&ChrW(52)&ChrW(60)&ChrW(63)&ChrW(50)&ChrW(62)&ChrW(54)),objTest.nickname,200,1),array(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(73)),objTest.sex,50,1),array(OOOOOO0O(ChrW(52)&ChrW(58)&ChrW(69)&ChrW(74)),objTest.city,0,0),array(OOOOOO0O(ChrW(52)&ChrW(64)&ChrW(70)&ChrW(63)&ChrW(69)&ChrW(67)&ChrW(74)),objTest.country,50,1),array(OOOOOO0O(ChrW(65)&ChrW(67)&ChrW(64)&ChrW(71)&ChrW(58)&ChrW(63)&ChrW(52)&ChrW(54)),objTest.province,50,1),array(OOOOOO0O(ChrW(61)&ChrW(50)&ChrW(63)&ChrW(56)&ChrW(70)&ChrW(50)&ChrW(56)&ChrW(54)),objTest.language,50,1),array(OOOOOO0O(ChrW(57)&ChrW(54)&ChrW(50)&ChrW(53)&ChrW(58)&ChrW(62)&ChrW(56)&ChrW(70)&ChrW(67)&ChrW(61)),objTest.headimgurl,0,1),array(OOOOOO0O(ChrW(68)&ChrW(70)&ChrW(51)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(51)&ChrW(54)&ChrW(48)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)),FromUnixTime(objTest.subscribe_time),50,1))
call Cls.db.dbnew(OOOOOO0O(ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(46)),data,OOOOOO0O(ChrW(117)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(125)&ChrW(50)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(86))&FromUserName&OOOOOO0O(ChrW(86)))
End Function
Function DelUser(id)
Cls.db.dbdel OOOOOO0O(ChrW(44)&ChrW(68)&ChrW(74)&ChrW(68)&ChrW(48)&ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(46)),OOOOOO0O(ChrW(64)&ChrW(65)&ChrW(54)&ChrW(63)&ChrW(58)&ChrW(53)&ChrW(108)&ChrW(86))&id&OOOOOO0O(ChrW(86))
End Function
Private function GetToken()
dim datadb
dim appid,appsecret,access_token,token_time,expires_in
set rs=anxinMall.db(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(65)&ChrW(65)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(50)&ChrW(65)&ChrW(65)&ChrW(68)&ChrW(54)&ChrW(52)&ChrW(67)&ChrW(54)&ChrW(69)&ChrW(91)&ChrW(50)&ChrW(52)&ChrW(52)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(48)&ChrW(69)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)&ChrW(91)&ChrW(69)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)&ChrW(48)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(91)&ChrW(54)&ChrW(73)&ChrW(65)&ChrW(58)&ChrW(67)&ChrW(54)&ChrW(68)&ChrW(48)&ChrW(58)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(48)&ChrW(52)&ChrW(64)&ChrW(63)&ChrW(55)&ChrW(58)&ChrW(56)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(53)&ChrW(108)&ChrW(96)),3)
AppId=rs(OOOOOO0O(ChrW(50)&ChrW(65)&ChrW(65)&ChrW(58)&ChrW(53)))
Appsecret=rs(OOOOOO0O(ChrW(112)&ChrW(65)&ChrW(65)&ChrW(68)&ChrW(54)&ChrW(52)&ChrW(67)&ChrW(54)&ChrW(69)))
Access_token=rs(OOOOOO0O(ChrW(112)&ChrW(52)&ChrW(52)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(48)&ChrW(69)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)))
Token_Time=rs(OOOOOO0O(ChrW(37)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)&ChrW(48)&ChrW(37)&ChrW(58)&ChrW(62)&ChrW(54)))
Expires_In=rs(OOOOOO0O(ChrW(116)&ChrW(73)&ChrW(65)&ChrW(58)&ChrW(67)&ChrW(54)&ChrW(68)&ChrW(48)&ChrW(120)&ChrW(63)))
rs.close
set rs=nothing
GetToken=Access_token
If datediff(OOOOOO0O(ChrW(68)),Token_Time,Now())>Expires_In then
dim strJson,objTest
strJson=GetURL(GetTokenUtl&OOOOOO0O(ChrW(56)&ChrW(67)&ChrW(50)&ChrW(63)&ChrW(69)&ChrW(48)&ChrW(69)&ChrW(74)&ChrW(65)&ChrW(54)&ChrW(108)&ChrW(52)&ChrW(61)&ChrW(58)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(48)&ChrW(52)&ChrW(67)&ChrW(54)&ChrW(53)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(58)&ChrW(50)&ChrW(61)&ChrW(85)&ChrW(50)&ChrW(65)&ChrW(65)&ChrW(58)&ChrW(53)&ChrW(108))&AppId&OOOOOO0O(ChrW(85)&ChrW(68)&ChrW(54)&ChrW(52)&ChrW(67)&ChrW(54)&ChrW(69)&ChrW(108))&Appsecret&"")
if InStr(strJson,OOOOOO0O(ChrW(54)&ChrW(67)&ChrW(67)&ChrW(52)&ChrW(64)&ChrW(53)&ChrW(54)))>0 then GetToken="":exit function
Call InitScriptControl : Set objTest = getJSONObject(strJson)
Access_token=objTest.access_token
Expires_In=objTest.expires_in
call anxinMall.db(OOOOOO0O(ChrW(70)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(48)&ChrW(52)&ChrW(64)&ChrW(63)&ChrW(55)&ChrW(58)&ChrW(56)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(50)&ChrW(52)&ChrW(52)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(48)&ChrW(69)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)&ChrW(108)&ChrW(86))&Access_token&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(116)&ChrW(73)&ChrW(65)&ChrW(58)&ChrW(67)&ChrW(54)&ChrW(68)&ChrW(48)&ChrW(120)&ChrW(63)&ChrW(108)&ChrW(86))&Expires_In&OOOOOO0O(ChrW(86)&ChrW(91)&ChrW(69)&ChrW(64)&ChrW(60)&ChrW(54)&ChrW(63)&ChrW(48)&ChrW(69)&ChrW(58)&ChrW(62)&ChrW(54)&ChrW(108)&ChrW(82))&now()&OOOOOO0O(ChrW(82)&ChrW(32)&ChrW(44)&ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(53)&ChrW(108)&ChrW(96)),0)
GetToken=Access_token
End If
End function
Function PostURL(url,PostStr)
dim Retrieval
Set Retrieval = Server.CreateObject(OOOOOO0O(ChrW(124)&ChrW(58)&ChrW(52)&ChrW(67)&ChrW(64)&ChrW(68)&ChrW(64)&ChrW(55)&ChrW(69)&ChrW(93)&ChrW(41)&ChrW(124)&ChrW(123)&ChrW(119)&ChrW(37)&ChrW(37)&ChrW(33)))
With Retrieval
.Open OOOOOO0O(ChrW(33)&ChrW(126)&ChrW(36)&ChrW(-243)&ChrW(37)), url, false ,"" ,""
.setRequestHeader OOOOOO0O(ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(54)&ChrW(63)&ChrW(69)&ChrW(92)&ChrW(37)&ChrW(74)&ChrW(65)&ChrW(54)),OOOOOO0O(ChrW(50)&ChrW(65)&ChrW(65)&ChrW(61)&ChrW(58)&ChrW(52)&ChrW(50)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(94)&ChrW(73)&ChrW(92)&ChrW(72)&ChrW(72)&ChrW(72)&ChrW(92)&ChrW(55)&ChrW(64)&ChrW(67)&ChrW(62)&ChrW(92)&ChrW(70)&ChrW(67)&ChrW(61)&ChrW(54)&ChrW(63)&ChrW(52)&ChrW(64)&ChrW(53)&ChrW(54)&ChrW(53))
.Send(PostStr)
PostURL = .responsetext
End With
Set Retrieval = Nothing
End Function
Function GetURL(url)
dim http
set http=server.createobject(OOOOOO0O(ChrW(62)&ChrW(58)&ChrW(52)&ChrW(67)&ChrW(64)&ChrW(68)&ChrW(64)&ChrW(55)&ChrW(69)&ChrW(93)&ChrW(73)&ChrW(62)&ChrW(61)&ChrW(57)&ChrW(69)&ChrW(69)&ChrW(65)))
http.open OOOOOO0O(ChrW(56)&ChrW(54)&ChrW(69)),url,false
http.setRequestHeader OOOOOO0O(ChrW(120)&ChrW(55)&ChrW(92)&ChrW(124)&ChrW(64)&ChrW(53)&ChrW(58)&ChrW(55)&ChrW(58)&ChrW(54)&ChrW(53)&ChrW(92)&ChrW(36)&ChrW(-243)&ChrW(58)&ChrW(63)&ChrW(52)&ChrW(54)),"0"
http.send()
GetURL=http.responsetext
set http=nothing
End Function
Function FromUnixTime(intTime)
If IsEmpty(intTime) Or Not IsNumeric(intTime) Then
FromUnixTime = Now()
Exit Function
End If
FromUnixTime = DateAdd(OOOOOO0O(ChrW(68)), intTime, OOOOOO0O(ChrW(96)&ChrW(104)&ChrW(102)&ChrW(95)&ChrW(92)&ChrW(96)&ChrW(92)&ChrW(96)&ChrW(32)&ChrW(44)&ChrW(95)&ChrW(105)&ChrW(95)&ChrW(105)&ChrW(95)))
FromUnixTime = DateAdd(OOOOOO0O(ChrW(57)), 8, FromUnixTime)
End Function
Dim sc4Json
Sub InitScriptControl
Set sc4Json = Server.CreateObject(OOOOOO0O(ChrW(124)&ChrW(36)&ChrW(-243)&ChrW(36)&ChrW(-243)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(67)&ChrW(64)&ChrW(61)&ChrW(93)&ChrW(36)&ChrW(-243)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(114)&ChrW(64)&ChrW(63)&ChrW(69)&ChrW(67)&ChrW(64)&ChrW(61)))
sc4Json.Language = OOOOOO0O(ChrW(121)&ChrW(50)&ChrW(71)&ChrW(50)&ChrW(36)&ChrW(-243)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69))
sc4Json.AddCode OOOOOO0O(ChrW(71)&ChrW(50)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(37)&ChrW(54)&ChrW(62)&ChrW(65)&ChrW(108)&ChrW(63)&ChrW(70)&ChrW(61)&ChrW(61)&ChrW(106)&ChrW(55)&ChrW(70)&ChrW(63)&ChrW(52)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(56)&ChrW(54)&ChrW(69)&ChrW(121)&ChrW(36)&ChrW(-243)&ChrW(112)&ChrW(67)&ChrW(67)&ChrW(50)&ChrW(74)&ChrW(87)&ChrW(50)&ChrW(67)&ChrW(67)&ChrW(91)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(53)&ChrW(54)&ChrW(73)&ChrW(88)&ChrW(76)&ChrW(58)&ChrW(69)&ChrW(54)&ChrW(62)&ChrW(37)&ChrW(54)&ChrW(62)&ChrW(65)&ChrW(108)&ChrW(50)&ChrW(67)&ChrW(67)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(53)&ChrW(54)&ChrW(73)&ChrW(46)&ChrW(106)&ChrW(78))
End Sub
Function getJSONObject(strJSON)
sc4Json.AddCode OOOOOO0O(ChrW(71)&ChrW(50)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(59)&ChrW(68)&ChrW(64)&ChrW(63)&ChrW(126)&ChrW(51)&ChrW(59)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(108)&ChrW(32)&ChrW(44)) & strJSON
Set getJSONObject = sc4Json.CodeObject.jsonObject
End Function
Sub getJSArrayItem(objDest,objJSArray,index)
On Error Resume Next
sc4Json.Run OOOOOO0O(ChrW(56)&ChrW(54)&ChrW(69)&ChrW(121)&ChrW(36)&ChrW(-243)&ChrW(112)&ChrW(67)&ChrW(67)&ChrW(50)&ChrW(74)),objJSArray, index
Set objDest = sc4Json.CodeObject.itemTemp
If Err.number=0 Then Exit Sub
objDest = sc4Json.CodeObject.itemTemp
End Sub
public function enhtml(byval t0)
dim reg
if isnull(t0) then enhtml="":exit function
if t0=OOOOOO0O(ChrW(107)&ChrW(65)&ChrW(109)&ChrW(85)&ChrW(63)&ChrW(51)&ChrW(68)&ChrW(65)&ChrW(106)&ChrW(107)&ChrW(94)&ChrW(65)&ChrW(109)) then enhtml="":exit function
t0=replace(t0,OOOOOO0O(ChrW(85)),OOOOOO0O(ChrW(85)&ChrW(50)&ChrW(62)&ChrW(65)&ChrW(106)))
t0=replace(t0,OOOOOO0O(ChrW(86)),OOOOOO0O(ChrW(85)&ChrW(82)&ChrW(98)&ChrW(104)&ChrW(106)))
t0=replace(t0,OOOOOO0O(ChrW(81)),OOOOOO0O(ChrW(85)&ChrW(82)&ChrW(98)&ChrW(99)&ChrW(106)))
t0=replace(t0,OOOOOO0O(ChrW(107)),OOOOOO0O(ChrW(85)&ChrW(61)&ChrW(69)&ChrW(106)))
t0=replace(t0,OOOOOO0O(ChrW(109)),OOOOOO0O(ChrW(85)&ChrW(56)&ChrW(69)&ChrW(106)))
set reg=new regexp
reg.ignorecase=true
reg.global=true
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(72)&ChrW(88)&ChrW(87)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(57)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(95)&ChrW(96)&ChrW(106)&ChrW(67)&ChrW(54)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(68)&ChrW(88)&ChrW(87)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(54)&ChrW(61)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(95)&ChrW(96)&ChrW(106)&ChrW(52)&ChrW(69)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(58)&ChrW(88)&ChrW(87)&ChrW(63)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(69)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(63)&ChrW(68)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(95)&ChrW(96)&ChrW(106)&ChrW(67)&ChrW(69)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(52)&ChrW(88)&ChrW(87)&ChrW(67)&ChrW(54)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(67)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(95)&ChrW(96)&ChrW(106)&ChrW(50)&ChrW(69)&ChrW(54)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(53)&ChrW(88)&ChrW(87)&ChrW(67)&ChrW(64)&ChrW(65)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(67)&ChrW(64)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(96)&ChrW(97)&ChrW(106)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(50)&ChrW(88)&ChrW(87)&ChrW(61)&ChrW(69)&ChrW(54)&ChrW(67)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(61)&ChrW(69)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(95)&ChrW(96)&ChrW(106)&ChrW(67)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(53)&ChrW(88)&ChrW(87)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(69)&ChrW(54)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(54)&ChrW(61)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(95)&ChrW(96)&ChrW(106)&ChrW(69)&ChrW(54)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(70)&ChrW(88)&ChrW(87)&ChrW(65)&ChrW(53)&ChrW(50)&ChrW(69)&ChrW(54)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(65)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(95)&ChrW(95)&ChrW(106)&ChrW(50)&ChrW(69)&ChrW(54)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(45)&ChrW(68)&ChrW(88)&ChrW(87)&ChrW(64)&ChrW(67)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(64)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(96)&ChrW(99)&ChrW(106)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(59)&ChrW(50)&ChrW(71)&ChrW(50)&ChrW(88)&ChrW(87)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(96)&ChrW(97)&ChrW(106)&ChrW(69)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(59)&ChrW(88)&ChrW(87)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(96)&ChrW(97)&ChrW(106)&ChrW(69)))
reg.pattern=OOOOOO0O(ChrW(87)&ChrW(71)&ChrW(51)&ChrW(88)&ChrW(87)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(65)&ChrW(69)&ChrW(88))
t0=reg.replace(t0,OOOOOO0O(ChrW(83)&ChrW(96)&ChrW(68)&ChrW(52)&ChrW(67)&ChrW(58)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(96)&ChrW(97)&ChrW(106)&ChrW(69)))
if instr(t0,OOOOOO0O(ChrW(54)&ChrW(73)&ChrW(65)&ChrW(67)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(64)&ChrW(63)))<>0 then
t0=replace(t0,OOOOOO0O(ChrW(54)&ChrW(73)&ChrW(65)&ChrW(67)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(64)&ChrW(63)),OOOOOO0O(ChrW(54)&ChrW(85)&ChrW(82)&ChrW(96)&ChrW(102)&ChrW(98)&ChrW(106)&ChrW(73)&ChrW(65)&ChrW(67)&ChrW(54)&ChrW(68)&ChrW(68)&ChrW(58)&ChrW(64)&ChrW(63)),1,-1,0)
end if
enhtml=t0
end function
function dehtml(byval t0)
if isnull(t0) then
dehtml=""
exit function
end if
t0=replace(t0,OOOOOO0O(ChrW(85)&ChrW(50)&ChrW(62)&ChrW(65)&ChrW(106)),OOOOOO0O(ChrW(85)))
t0=replace(t0,OOOOOO0O(ChrW(85)&ChrW(82)&ChrW(98)&ChrW(104)&ChrW(106)),OOOOOO0O(ChrW(86)))
t0=replace(t0,OOOOOO0O(ChrW(85)&ChrW(82)&ChrW(98)&ChrW(99)&ChrW(106)),OOOOOO0O(ChrW(81)))
t0=replace(t0,OOOOOO0O(ChrW(85)&ChrW(61)&ChrW(69)&ChrW(106)),OOOOOO0O(ChrW(107)))
t0=replace(t0,OOOOOO0O(ChrW(85)&ChrW(56)&ChrW(69)&ChrW(106)),OOOOOO0O(ChrW(109)))
t0=replace(t0,chr(10),vbcrlf)
dehtml=t0
end function
Response.Charset = OOOOOO0O(ChrW(118)&ChrW(113)&ChrW(97)&ChrW(98)&ChrW(96)&ChrW(97))
dim id : id=enhtml(request(OOOOOO0O(ChrW(58)&ChrW(53))))
dim act : act=enhtml(request(OOOOOO0O(ChrW(50)&ChrW(52)&ChrW(69))))
dim SqlStr,datadb
if len(id)>0 then
SqlStr=OOOOOO0O(ChrW(72)&ChrW(57)&ChrW(54)&ChrW(67)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(65)&ChrW(48)&ChrW(120)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(58)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(87))&id&OOOOOO0O(ChrW(88))
else
SqlStr=""
end if
if act=OOOOOO0O(ChrW(56)&ChrW(54)&ChrW(69)&ChrW(61)&ChrW(58)&ChrW(68)&ChrW(69)) then
set rs=anxinMall.db(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(65)&ChrW(48)&ChrW(69)&ChrW(58)&ChrW(69)&ChrW(61)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(48)&ChrW(65)&ChrW(58)&ChrW(52)&ChrW(62)&ChrW(68)&ChrW(56)&ChrW(46)&ChrW(32)&ChrW(44))&sqlstr&OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(51)&ChrW(74)&ChrW(32)&ChrW(44)&ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(53)&ChrW(54)&ChrW(68)&ChrW(52)),3)
do while not rs.eof
response.write OOOOOO0O(ChrW(107)&ChrW(64)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(108)&ChrW(86))&rs(OOOOOO0O(ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)))&OOOOOO0O(ChrW(86)&ChrW(109))&rs(OOOOOO0O(ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)))&OOOOOO0O(ChrW(48))&rs(OOOOOO0O(ChrW(65)&ChrW(48)&ChrW(69)&ChrW(58)&ChrW(69)&ChrW(61)&ChrW(54)))&OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(64)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(109))
rs.movenext
loop
rs.close
set rs=nothing
else
id=Cint(request(OOOOOO0O(ChrW(58)&ChrW(53))))
set rs=anxinMall.db(OOOOOO0O(ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(32)&ChrW(44)&ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(91)&ChrW(65)&ChrW(48)&ChrW(69)&ChrW(58)&ChrW(69)&ChrW(61)&ChrW(54)&ChrW(32)&ChrW(44)&ChrW(55)&ChrW(67)&ChrW(64)&ChrW(62)&ChrW(32)&ChrW(44)&ChrW(44)&ChrW(50)&ChrW(63)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(124)&ChrW(50)&ChrW(61)&ChrW(61)&ChrW(48)&ChrW(72)&ChrW(54)&ChrW(58)&ChrW(73)&ChrW(58)&ChrW(63)&ChrW(48)&ChrW(65)&ChrW(61)&ChrW(70)&ChrW(56)&ChrW(48)&ChrW(65)&ChrW(58)&ChrW(52)&ChrW(62)&ChrW(68)&ChrW(56)&ChrW(61)&ChrW(58)&ChrW(68)&ChrW(69)&ChrW(46)&ChrW(32)&ChrW(44)&ChrW(64)&ChrW(67)&ChrW(53)&ChrW(54)&ChrW(67)&ChrW(32)&ChrW(44)&ChrW(51)&ChrW(74)&ChrW(32)&ChrW(44)&ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)&ChrW(32)&ChrW(44)&ChrW(53)&ChrW(54)&ChrW(68)&ChrW(52)),3)
if rs.recordcount>0 then
do while not rs.eof
response.write OOOOOO0O(ChrW(107)&ChrW(64)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(108)&ChrW(86))&rs(OOOOOO0O(ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)))&OOOOOO0O(ChrW(86))
if rs(OOOOOO0O(ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)))=id then response.write OOOOOO0O(ChrW(32)&ChrW(44)&ChrW(68)&ChrW(54)&ChrW(61)&ChrW(54)&ChrW(52)&ChrW(69)&ChrW(54)&ChrW(53))
response.write OOOOOO0O(ChrW(109))&rs(OOOOOO0O(ChrW(65)&ChrW(48)&ChrW(58)&ChrW(53)))&OOOOOO0O(ChrW(48))&rs(OOOOOO0O(ChrW(65)&ChrW(48)&ChrW(69)&ChrW(58)&ChrW(69)&ChrW(61)&ChrW(54)))&OOOOOO0O(ChrW(107)&ChrW(94)&ChrW(64)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(109))
rs.movenext
loop
rs.close
set rs=nothing
else
response.write OOOOOO0O(ChrW(107)&ChrW(64)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(32)&ChrW(44)&ChrW(71)&ChrW(50)&ChrW(61)&ChrW(70)&ChrW(54)&ChrW(108)&ChrW(86)&ChrW(86)&ChrW(109)&ChrW(-27711)&ChrW(64)&ChrW(20630)&ChrW(64)&ChrW(26847)&ChrW(64)&ChrW(28593)&ChrW(64)&ChrW(27687)&ChrW(64)&ChrW(27987)&ChrW(64)&ChrW(-27715)&ChrW(64)&ChrW(22243)&ChrW(64)&ChrW(31218)&ChrW(64)&ChrW(-27736)&ChrW(64)&ChrW(110)&ChrW(94)&ChrW(64)&ChrW(65)&ChrW(69)&ChrW(58)&ChrW(64)&ChrW(63)&ChrW(109))
end if
end if
%>
<!--#include file="global.asp"-->