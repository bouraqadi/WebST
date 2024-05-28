Class {
	#name : #WsBridgeClient,
	#superclass : #PjBrowserBridgeClient,
	#category : #'WebST-Base-Apps'
}

{ #category : #accessing }
WsBridgeClient >> initializeWithBridge: aBridge [

	super initializeWithBridge: aBridge.
	self server html: appClass html
]
