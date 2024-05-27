Class {
	#name : #WsBridgeClient,
	#superclass : #PjBrowserBridgeClient,
	#category : #'WebST-Base-Apps'
}

{ #category : #accessing }
WsBridgeClient >> initializeWithBridge: aBrdige [

	super initializeWithBridge: aBrdige.
	self server html: appClass html
]
