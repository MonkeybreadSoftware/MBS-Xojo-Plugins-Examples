#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   524
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1739700223
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Windows Store"
   Visible         =   True
   Width           =   764
   Begin PushButton GetAppLicenseButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "GetAppLicense"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   122
   End
   Begin PushButton GetStoreProductForCurrentAppButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "GetStoreProductForCurrentApp"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   154
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   212
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   450
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   724
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton RequestRateAndReviewAppAsyncButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "RequestRateAndReviewApp"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   378
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   194
   End
   Begin PushButton RequestPurchaseButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Request Purchase"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   584
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  context = New WindowsStoreContextMBS(Self)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GetAppLicenseAsync()
		  Log "GetAppLicenseAsync..."
		  context.GetAppLicenseAsync AddressOf GetAppLicenseCompleted
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAppLicenseCompleted(AsyncStatus as Integer, appLicense as WindowsStoreAppLicenseMBS)
		  If AsyncStatus <> context.kAsyncStatusCompleted Then
		    MsgBox "Async call failed."
		    Return
		  End If
		  
		  List.AddRow "GetAppLicenseCompleted: "+str(AsyncStatus)
		  Break
		  
		  if appLicense <> nil then
		    log "SkuStoreId: " + appLicense.SkuStoreId
		    Log "IsActive: " + appLicense.IsActive.YesNo
		    Log "IsTrial: " + appLicense.IsTrial.YesNo
		    log "TrialUniqueId: " + appLicense.TrialUniqueId
		    Log "TrialTimeRemaining: " + CStr(appLicense.TrialTimeRemaining)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetStoreProductForCurrentAppAsync()
		  Log "GetStoreProductForCurrentAppAsync..."
		  context.GetStoreProductForCurrentAppAsync AddressOf GetStoreProductForCurrentAppCompleted
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetStoreProductForCurrentAppCompleted(AsyncStatus as Integer, result as WindowsStoreProductResultMBS)
		  If AsyncStatus <> context.kAsyncStatusCompleted Then
		    MsgBox "Async call failed."
		    Return
		  End If
		  
		  List.AddRow "GetStoreProductForCurrentAppCompleted: "+Str(AsyncStatus)
		  Break
		  
		  if result <> nil then
		    dim product as WindowsStoreProductMBS = result.Product
		    if product = nil then
		      log "no product found."
		    else
		      log "StoreId: " + product.StoreId
		      log "Title: " + product.Title
		      log "Description: " + product.Description
		      log "Language: " + product.Language
		      Log "FormattedPrice: " + product.Price.FormattedPrice
		      Log ""
		      
		      Dim SKUs() As WindowsStoreSKUMBS = product.SKUs
		      For Each SKU As WindowsStoreSKUMBS In SKUs
		        Log "SKU: "+sku.StoreId
		        Log "Title: "+sku.Title
		        Log "Price: "+sku.Price.FormattedPrice
		        Log "Description "+sku.Description
		        Log "IsTrial: "+sku.IsTrial.YesNo
		        Log "IsSubscription: "+sku.IsSubscription.YesNo
		      Next
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetStoreProductsAsync()
		  Log "GetStoreProductsAsync..."
		  
		  // please change ID for the item to find
		  
		  Dim StoreIds() As String = Array("12345", "67890")
		  Dim ProductKinds() As String = Array("**Application**", "**Game**", "**Consumable**", "**UnmanagedConsumable**", "**Durable**")
		  
		  context.GetStoreProductsAsync ProductKinds, StoreIds, AddressOf GetStoreProductsAsyncCompleted
		  
		  
		  
		  'String value    Description
		  '**Application**   
		  ' An app that belongs To any category other than **Games**. For more info, see [Category And subcategory table](https://docs.microsoft.com/windows/uwp/publish/category-and-subcategory-table).
		  '**Game**    
		  ' An app that belongs To the **Games** category. For more info, see [Category And subcategory table](https://docs.microsoft.com/windows/uwp/publish/category-and-subcategory-table).
		  '**Consumable**   
		  ' A Store-managed consumable add-on that can be purchased, used, And purchased again. Microsoft keeps track Of the user's balance for these types of add-ons.
		  '**UnmanagedConsumable**   
		  ' A developer-managed consumable add-on that can be purchased, used, And purchased again. Microsoft does Not keep track Of the user's balance for these types of add-ons; the developer is responsible for keeping track of the user's balance.
		  '**Durable**   
		  ' An add-on that persists For the lifetime that you specify In [Partner Center](https://partner.microsoft.com/dashboard). By default, durable add-ons never expire, in which case they can only be purchased once. If you specify a particular duration for the add-on, the user can repurchase the add-on after it expires.
		  '**Note** 
		  ' A **StoreProduct** that represents a [subscription add-on](https://docs.microsoft.com/windows/uwp/monetize/enable-subscription-add-ons-for-your-app) has the type **Durable**.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetStoreProductsAsyncCompleted(AsyncStatus as Integer, result as WindowsStoreProductQueryResultMBS)
		  If AsyncStatus <> context.kAsyncStatusCompleted Then
		    MsgBox "Async call failed."
		    Return
		  End If
		  
		  List.AddRow "GetStoreProductsAsyncCompleted: "+Str(AsyncStatus)
		  Break
		  
		  If result <> nil then
		    Dim products As dictionary = result.Products
		    Dim ProductStoreIDs() As Variant = products.Keys
		    
		    For Each key As Variant In ProductStoreIDs
		      dim product as WindowsStoreProductMBS = products.Value(key)
		      log "StoreId: " + product.StoreId
		      log "Title: " + product.Title
		      log "Description: " + product.Description
		      log "Language: " + product.Language
		      Log "FormattedPrice: " + product.Price.FormattedPrice
		      Log ""
		    next
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(s as string)
		  List.AddRow s
		  List.ScrollPosition = List.LastIndex
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestPurchaseAsync()
		  Log "RequestPurchaseAsync..."
		  
		  // please change ID for the item to purchase
		  
		  Const StoreID = "9NCMFFPJRVHC"
		  
		  context.RequestPurchaseAsync AddressOf RequestPurchaseCompleted, StoreID
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestPurchaseCompleted(AsyncStatus as Integer, result as WindowsStorePurchaseResultMBS)
		  If AsyncStatus <> context.kAsyncStatusCompleted Then
		    MsgBox "Async call failed."
		    Return
		  End If
		  
		  Select Case result.Status
		    
		  Case result.kStatusSucceeded
		    MsgBox "Purchase Succeeded."
		  Case result.kStatusAlreadyPurchased
		    MsgBox "Already Purchased."
		  Case result.kStatusNotPurchased
		    MsgBox "Not Purchased."
		  Case result.kStatusNetworkError
		    MsgBox "Network error."
		  Case result.kStatusServerError
		    MsgBox "Server error."
		  End Select
		  
		  
		  Break // see in debugger
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestRateAndReviewAppAsync()
		  Log "RequestRateAndReviewAppAsync..."
		  context.RequestRateAndReviewAppAsync AddressOf RequestRateAndReviewAppCompleted
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestRateAndReviewAppCompleted(AsyncStatus as Integer, result as WindowsStoreRateAndReviewResultMBS)
		  If AsyncStatus <> context.kAsyncStatusCompleted Then
		    MsgBox "Async call failed."
		    Return
		  End If
		  
		  List.AddRow "RequestRateAndReviewAppCompleted: "+str(AsyncStatus)
		  Break
		  
		  if result <> nil then
		    
		    dim status as integer = result.Status
		    dim StatusText as string
		    select case status
		    case result.kStatusCanceledByUser
		      StatusText = " CanceledByUser"
		    case result.kStatusError
		      StatusText = " Error"
		    case result.kStatusNetworkError
		      StatusText = " Network Error"
		    case result.kStatusSucceeded
		      StatusText = " Succeeded"
		    else
		      StatusText = " ?"
		    end Select
		    
		    Log "Status: " + Str(result.Status) + StatusText
		    Log "WasUpdated: " + result.WasUpdated.YesNo
		    log "ExtendedError: " + str(result.ExtendedError)
		    log "ExtendedJsonData: " + result.ExtendedJsonData
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		context As WindowsStoreContextMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events GetAppLicenseButton
	#tag Event
		Sub Action()
		  GetAppLicenseAsync
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetStoreProductForCurrentAppButton
	#tag Event
		Sub Action()
		  GetStoreProductForCurrentAppAsync
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RequestRateAndReviewAppAsyncButton
	#tag Event
		Sub Action()
		  RequestRateAndReviewAppAsync
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RequestPurchaseButton
	#tag Event
		Sub Action()
		  RequestPurchaseAsync
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
