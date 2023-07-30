<%

Class UserCart
Sub CreateCart()
Dim CFlag,iCount
dim mCart(6,0)
CFlag=CheckCart()
if CFlag=false then
For iCount =LBound(mCart,2) to UBound(mCart,2)
mCart(0,iCount)=""
next
Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))=mCart
end if
End Sub
Public Function CheckCart()
IF IsArray(Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))) THEN
CheckCart = true
ELSE
CheckCart = false
END IF
End Function
Function CheckEmpty()
dim mCart,i
mCart=Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))
For i =LBound(mCart,2) to UBound(mCart,2)
if mCart(0,i)<>"" then
CheckEmpty=false
Exit Function
end if
next
CheckEmpty=True
End Function
Function AddItem(aID,aName,aPrice1,aPrice2,aPrice3,aCount,aImage)
dim mCart,i
AddItem=false
if CheckItem(aID)=false then
mCart=Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))
i =UBound(mCart,2)
i=i+1
Redim preserve mCart(6,i)
mCart(0,i)=aID
mCart(1,i)=aName
mCart(2,i)=aPrice1
mCart(3,i)=aPrice2
mCart(4,i)=aPrice3
mCart(5,i)=aCount
mCart(6,i)=aImage
session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))=mCart
AddItem=True
Else
ModifItem aID,aCount,0
AddItem=True
End if
End Function
Sub DelItem(mID)
dim mCart,mount,j,i
response.Write(mID)
mCart = Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))
mount=UBound(mCart,2)
If mID=mount Then
mount=mount-1
mCart(0,mount+1)=""
ReDim Preserve mCart(6,mount)
Else
mount=mount-1
For i=mID To mount
For j=0 To 6
mCart(j,i)=mCart(j,i+1)
Next
Next
mCart(0,mount+1)=""
ReDim Preserve mCart(6,mount)
End If
session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))=mCart
End Sub
Sub ModifItem(mID,mCount,mFlag)
dim mCart,i
mCart = Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))
For i =LBound(mCart,2) to UBound(mCart,2)
if mCart(0,i)=mID then
select case mFlag
case 1
mCart(0,i)=ccur(mCart(5,i))-ccur(mCount)
case 0
if (Int(mCart(5,i))+Int(mCount))>0 then
mCart(5,i)= Int(mCart(5,i))+Int(mCount)
else
end if
case 2
if mCount=0 then
mCart(5,i)=0
mCart(0,i)=""
else
mCart(5,i)=mCount
end if
case 3
mCart(5,i)=0
mCart(0,i)=""
end select
session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))=mCart
exit Sub
end if
next
End Sub
Function ViewCart()
dim mCart
mCart=session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))
ViewCart=mCart
End Function
Function CheckItem(cID)
dim mCart,i
mCart =Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))
For i =LBound(mCart,2) to UBound(mCart,2)
if mCart(0,i)=cID then
CheckItem=True
exit Function
end if
next
CheckItem=false
End Function
Sub RemoveAll()
dim mCart,i
mCart = Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))
For i =LBound(mCart,2) to UBound(mCart,2)
mCart(0,i)=""
next
Session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))=mCart
End Sub
Function TPrice()
dim mCart,i
dim OutPrice(3)
mCart=session(OOOOOO0O(ChrW(38)&ChrW(68)&ChrW(54)&ChrW(67)&ChrW(114)&ChrW(50)&ChrW(67)&ChrW(69)))
for i=LBound(mCart,2) to UBound(mCart,2)
if mCart(0,i)<>"" then
Outprice(0) = CCur(Outprice(0)) + CCur(mCart(2,i))*CCur(mCart(5,i))
end if
next
TPrice=OutPrice
End Function
End Class
%>
<!--#include file="global.asp"-->