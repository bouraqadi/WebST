Class {
	#name : 'WsDivDomConnectionNotificationTest',
	#superclass : 'WsDomConnectionNotificationTest',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
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
