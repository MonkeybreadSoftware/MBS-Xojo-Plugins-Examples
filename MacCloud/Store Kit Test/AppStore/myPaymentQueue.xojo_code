#tag Class
Protected Class myPaymentQueue
Inherits SKPaymentQueueMBS
	#tag Event
		Sub restoreCompletedTransactionsFailedWithError(Error as NSErrorMBS)
		  MsgBox "Restoring completed transactions failed with Error: "+Error.localizedDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub updatedTransactions(transactions() as SKPaymentTransactionMBS)
		  System.DebugLog CurrentMethodName
		  
		  // Implement the updatedTransactions method
		  // The observer’s updatedTransactions method is called whenever new transactions are created or updated.
		  
		  for each transaction as SKPaymentTransactionMBS in transactions
		    
		    
		    Select case transaction.transactionState
		      
		    case SKPaymentTransactionMBS.StatePurchased
		      completeTransaction Transaction
		      
		    case SKPaymentTransactionMBS.StateFailed
		      failedTransaction transaction
		      
		    case SKPaymentTransactionMBS.StateRestored
		      restoreTransaction transaction
		    end Select
		  next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub completeTransaction(transaction as SKPaymentTransactionMBS)
		  System.DebugLog CurrentMethodName
		  
		  
		  // Your observer provides the product when the user successfully purchases an item.
		  
		  MsgBox "Transaction is now complete"+EndOfLine+EndOfLine+Transaction.payment.productIdentifier
		  
		  // todo
		  recordTransaction transaction
		  provideContent transaction.payment.productIdentifier
		  
		  // Remove the transaction from the payment queue.
		  AppStoreModule.PaymentQueue.finishTransaction Transaction
		  
		  
		  
		  // A successful transaction includes a transactionIdentifier property and a transactionReceipt 
		  // property that record the details of the processed payment. Your application is not required
		  // to do anything with this information. You may wish to record this information to establish
		  // an audit trail for the transaction. If your application uses a server to deliver content,
		  // the receipt can be sent to your server and validated by the App Store.
		  
		  // It is critical that your application take whatever steps are necessary to provide the
		  // product that the user purchased. Payment has already been collected, so the user expects 
		  // to receive the new purchase. See “Feature Delivery” for suggestions on how you might implement this.
		  
		  // Once you’ve delivered the product, your application must call finishTransaction 
		  // to complete the transaction. When you call finishTransaction, the transaction 
		  // is removed from the payment queue. To ensure that products are not lost, your 
		  // application should deliver the product before calling finishTransaction.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub failedTransaction(transaction as SKPaymentTransactionMBS)
		  System.DebugLog CurrentMethodName
		  
		  
		  // Finish the transaction for a failed purchase.
		  
		  if transaction.error.code <> StoreKitMBS.SKErrorPaymentCancelled then
		    
		    // Optionally, display an error here.
		    
		    MsgBox "Transaction is failed."+EndOfLine+EndOfLine+Transaction.error.localizedDescription
		    
		  end if
		  
		  AppStoreModule.PaymentQueue.finishTransaction Transaction
		  
		  // Usually a transaction fails because the user decided not to purchase the item.
		  // Your application can read the error field on a failed transaction to learn
		  // exactly why the transaction failed.
		  
		  // The only requirement for a failed purchase is that your application remove 
		  // it from the queue. If your application chooses to put up an dialog displaying
		  // the error to the user, you should avoid presenting an error when the user
		  // cancels a purchase.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub provideContent(identifier as string)
		  
		  // todo
		  
		  System.DebugLog CurrentMethodName
		  
		  MsgBox "Provide Content for "+identifier
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub recordTransaction(Transaction as SKPaymentTransactionMBS)
		  // todo
		  
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub restoreTransaction(transaction as SKPaymentTransactionMBS)
		  // Finish the transaction for a restored purchase.
		  
		  System.DebugLog CurrentMethodName
		  
		  recordTransaction transaction
		  provideContent transaction.originalTransaction.payment.productIdentifier
		  
		  AppStoreModule.PaymentQueue.finishTransaction Transaction
		  
		  
		  // This routine is similar to that for a purchased item.
		  // A restored purchase provides a new transaction, including a different transaction
		  // identifier and receipt. You can save this information separately as part of any
		  // audit trail if you desire. However, when it comes time to complete the transaction,
		  // you’ll want to recover the original transaction that holds the actual payment object
		  // and use its product identifier.
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
