Class {
	#name : 'WsComponentDomConnectionNotificationTest',
	#superclass : 'WsDomConnectionNotificationTest',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> newElement [
 	^self evalBlock: [ WsMinimalComponent new ].
	
]
