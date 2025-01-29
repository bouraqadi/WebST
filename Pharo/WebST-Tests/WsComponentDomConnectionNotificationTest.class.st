Class {
	#name : 'WsComponentDomConnectionNotificationTest',
	#superclass : 'WsDomConnectionNotificationTest',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> newElement [
 	^self evalBlock: [ WsMinimalComponent new ].
	
]
