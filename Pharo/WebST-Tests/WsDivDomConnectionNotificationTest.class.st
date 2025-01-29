Class {
	#name : 'WsDivDomConnectionNotificationTest',
	#superclass : 'WsDomConnectionNotificationTest',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsDivDomConnectionNotificationTest >> newElement [
	^document createElement: #div.

]

{ #category : 'tests' }
WsDivDomConnectionNotificationTest >> setUp [
	super setUp.
	"Ensure Node extension for supporting DOM connection notifications"
	self bridge loadClass: WsNode.
	
]
